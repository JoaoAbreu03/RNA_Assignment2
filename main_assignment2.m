clear all; clc; close all; rehash;
L = ann_lib();


%  Config inicial
SEED  = 42;                        
rand('state', SEED);  randn('state', SEED);

fracs = [0.70 0.15 0.15];          % treino / validacao / teste
N     = 10;                        % neuronios da rede de referencia

% molhora do learning rate: grelha logaritmica de 6 valores, 5 repeticoes
% (seeds 42 a 46 para os pesos iniciais e a ordem dos mini-batches), escolha
% pela mediana da melhor perda de VALIDACAO. Mini-batch B = 32 (GD e Adam).

lrGrid.gd   = 10 .^ (-3:0.5:-0.5);
lrGrid.adam = 10 .^ (-4:0.5:-1.5);
tuneSeeds   = SEED + (0:4);

% Experiencias finais: a run k usa a seed k 
finalSeeds = 1:30;

% Pastas e ficheiros de saida: tabelas, progresso e copia do ecra.
% Cada execucao comeca de raiz (nada e carregado de execucoes anteriores).
figDir = 'figuras';
resDir = 'resultados';
if ~exist(resDir, 'dir'), mkdir(resDir); end
logFile  = fullfile(resDir, 'progresso.txt');
if exist(logFile, 'file'), delete(logFile); end     % o log e acrescentado a cada passo
fidT = fopen(fullfile(resDir, 'tabelas.txt'), 'w');
outFile = fullfile(resDir, 'output_main.txt');      % copia de tudo o que sai no ecra
if exist(outFile, 'file'), delete(outFile); end
diary(outFile);

oB = L.fill_default_options();
fprintf('Definicoes fixas dos algoritmos:\n');
fprintf('  Mini-batch (GD e Adam): B = %d | Adam: beta1 = %.3f, beta2 = %.3f, eps = %.0e\n', ...
        oB.batch, oB.beta1, oB.beta2, oB.eps);
fprintf(['  BFGS: line search de backtracking (Armijo, c1 = %.0e), passo inicial 1, divide por 2,\n' ...
         '        max. %d tentativas | tolerancia do gradiente ||g|| < %.0e | max. iteracoes = %g\n' ...
         '        (o limite efetivo e o orcamento em epoch-equivalentes) | H inicial = I, escalada\n' ...
         '        por s''y/y''y na 1a iteracao | atualizacao so se s''y > 1e-10*||s||*||y||\n' ...
         '        | se a line search falha com H != I, H volta a I e tenta-se com -g (so para se falhar tambem\n' ...
         '        com -g)\n'], ...
        oB.c1, oB.maxLS, oB.gradTol, oB.maxIter);


%  CONCRETE 

cfgC.name    = 'Concrete';
cfgC.file    = 'Concrete_Data.csv';
cfgC.target  = 'Strength';                 
cfgC.names   = {'Cement', 'Slag', 'FlyAsh', 'Water', 'Superplast', 'CoarseAgg', 'FineAgg', 'Age', 'Strength'};
cfgC.units   = {'kg/m3', 'kg/m3', 'kg/m3', 'kg/m3', 'kg/m3', 'kg/m3', 'kg/m3', 'days', 'MPa'};
cfgC.removeDuplicates = true;                    
cfgC.nonNegative = true;                        
cfgC.groupCols = 1:7;                            
cfgC.logCols   = {'Age'};                       
cfgC.ratios    = {'Water', 'Cement'};            
cfgC.budget    = 1000;                           

%% 1 Leitura e inspecao inicial
DC = L.load_dataset(cfgC);
L.describe_dataset(DC);

%% 2 Limpeza
[DC, repC] = L.clean_dataset(DC);

%% 3 Analise exploratoria (EDA)
L.run_exploratory_analysis(DC, repC, figDir);

%% 4 Feature engineering
FC = L.create_features(DC, fracs, SEED, figDir);

%% 5 Divisao treino / validacao / teste
IC = L.split_train_val_test(DC, FC, fracs, SEED, figDir);

%% 6 Normalizacao (z-score com media e desvio SO do treino)
PC = L.split_and_normalize(FC.X, FC.y, IC, FC.names, FC.dates);

%% 7 Modelos de referencia (ajustados no treino)
refC = L.fit_baseline_models(DC, PC);

%% 8 Redes: arquiteturas e verificacao do gradiente (bonus)
L.check_architectures_and_gradients(DC, PC, N, SEED);

%% 9 Afinacao do learning rate (validacao)
LRC = L.tune_learning_rates(DC, PC, lrGrid, tuneSeeds, logFile, figDir, N);

%% 10 Experiencias finais (o teste so e usado a partir daqui)
EsC = L.run_final_experiments(DC, PC, LRC, finalSeeds, logFile, N);

%% 11 Resultados e avaliacao no teste
refC = L.evaluate_baseline_models(DC, refC, PC, fidT);
L.report_results(DC, PC, EsC, refC, N, fidT, figDir);
L.plot_test_predictions(DC, PC, EsC, refC, N, figDir);


%  MELBOURNE 

cfgM.name    = 'Melbourne';
cfgM.file    = 'daily-minimum-temperatures-in-me.csv';
cfgM.names   = {'Date', 'Tmin'};
cfgM.units   = {'', 'degC'};
cfgM.questionAsMinus = true;                     % '?0.2' = -0.2 (sinal perdido)
cfgM.jumpK      = 4;                             % saltos > 4 desvios sao assinalados
cfgM.validRange = [-10 45];                      % limite fisico razoavel (degC)
cfgM.maxP       = 30;                            % maior janela testada
cfgM.calendar   = true;                          % sin/cos do dia do ano
cfgM.budget     = 500;                           % o melhor modelo surge antes de 200 epochs

%% 1 Leitura e inspecao inicial
DM = L.load_dataset(cfgM);
L.describe_dataset(DM);

%% 2 Limpeza
[DM, repM] = L.clean_dataset(DM);

%% 3 Analise exploratoria (EDA)
L.run_exploratory_analysis(DM, repM, figDir);

%% 4 Feature engineering
FM = L.create_features(DM, fracs, SEED, figDir);

%% 5 Divisao treino / validacao / teste
IM = L.split_train_val_test(DM, FM, fracs, SEED, figDir);

%% 6 Normalizacao (z-score com media e desvio SO do treino)
PM = L.split_and_normalize(FM.X, FM.y, IM, FM.names, FM.dates);

%% 7 Modelos de referencia (ajustados no treino)
refM = L.fit_baseline_models(DM, PM);

%% 8 Redes: arquiteturas e verificacao do gradiente (bonus)
L.check_architectures_and_gradients(DM, PM, N, SEED);

%% 9 Afinacao do learning rate (validacao)
LRM = L.tune_learning_rates(DM, PM, lrGrid, tuneSeeds, logFile, figDir, N);

%% 10 Experiencias finais (o teste so e usado a partir daqui)
EsM = L.run_final_experiments(DM, PM, LRM, finalSeeds, logFile, N);

%% 11 Resultados e avaliacao no teste
refM = L.evaluate_baseline_models(DM, refM, PM, fidT);
L.report_results(DM, PM, EsM, refM, N, fidT, figDir);
L.plot_test_predictions(DM, PM, EsM, refM, N, figDir);

fclose(fidT);
fprintf('\nTabelas em %s | figuras em %s\n', fullfile(resDir, 'tabelas.txt'), figDir);

diary off                          % fecha a copia do ecra (output_main.txt)
