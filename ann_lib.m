function L = ann_lib()
% ANN_LIB  Biblioteca do Assignment 2. Compativel com MATLAB R2007a e GNU Octave.
% Funciona com qualquer CSV numerico: cada dataset e descrito por uma estrutura
% cfg (so cfg.name e cfg.file sao obrigatorios, ver load_dataset). Se o CSV tiver
% uma coluna de datas e tratado como serie temporal (previsao de t+1), senao
% como regressao estatica.
% Uso:  L = ann_lib();   D = L.load_dataset(cfg);   [D, R] = L.clean_dataset(D);

% Um handle por cada funcao da biblioteca, pela ordem do ficheiro.

% 0. PIPELINE GENERICO
L.get_config_field                    = @get_config_field;
L.find_column_index                   = @find_column_index;
L.find_column_indices                 = @find_column_indices;
L.load_dataset                        = @load_dataset;
L.describe_dataset                    = @describe_dataset;
L.clean_dataset                       = @clean_dataset;
L.run_exploratory_analysis            = @run_exploratory_analysis;
L.create_features                     = @create_features;
L.split_train_val_test                = @split_train_val_test;
L.fit_baseline_models                 = @fit_baseline_models;
L.evaluate_baseline_models            = @evaluate_baseline_models;
L.plot_test_predictions               = @plot_test_predictions;

% 1. LEITURA DE CSV
L.read_csv                            = @read_csv;
L.split_csv_line                      = @split_csv_line;

% 2. INSPECAO E LIMPEZA
L.print_descriptive_stats             = @print_descriptive_stats;
L.clean_static_data                   = @clean_static_data;
L.clean_time_series                   = @clean_time_series;

% 3. EDA - GRAFICOS GERAIS
L.plot_histograms                     = @plot_histograms;
L.compute_correlation_matrix          = @compute_correlation_matrix;
L.plot_correlation_heatmap            = @plot_correlation_heatmap;
L.plot_inputs_vs_target               = @plot_inputs_vs_target;

% 3. EDA - SERIES TEMPORAIS
L.compute_acf                         = @compute_acf;
L.compute_pacf                        = @compute_pacf;
L.plot_time_series                    = @plot_time_series;
L.plot_distribution                   = @plot_distribution;
L.plot_monthly_boxplots               = @plot_monthly_boxplots;
L.plot_annual_cycle                   = @plot_annual_cycle;
L.plot_acf_pacf                       = @plot_acf_pacf;
L.plot_lag1_scatter                   = @plot_lag1_scatter;

% 4. FEATURES, DIVISAO E NORMALIZACAO
L.create_lag_windows                  = @create_lag_windows;
L.split_random                        = @split_random;
L.split_random_by_group               = @split_random_by_group;
L.split_chronological                 = @split_chronological;
L.fit_zscore                          = @fit_zscore;
L.apply_zscore                        = @apply_zscore;
L.invert_zscore                       = @invert_zscore;
L.split_and_normalize                 = @split_and_normalize;
L.plot_chronological_split            = @plot_chronological_split;
L.plot_window_size_selection          = @plot_window_size_selection;

% 5. MODELOS LINEARES DE REFERENCIA E METRICAS
L.fit_linear_regression               = @fit_linear_regression;
L.predict_linear_regression           = @predict_linear_regression;
L.compute_regression_metrics          = @compute_regression_metrics;

% 6. REDE NEURONAL
L.get_architecture_ids                = @get_architecture_ids;
L.get_algorithm_list                  = @get_algorithm_list;
L.get_architecture_layers             = @get_architecture_layers;
L.get_architecture_names              = @get_architecture_names;
L.count_params                        = @count_params;
L.get_parameter_indices               = @get_parameter_indices;
L.init_params                         = @init_params;
L.predict_network                     = @predict_network;
L.loss_grad                           = @loss_grad;
L.check_gradient                      = @check_gradient;

% 7. ALGORITMOS DE TREINO
L.fill_default_options                = @fill_default_options;
L.create_history                      = @create_history;
L.train_minibatch_gd_or_adam          = @train_minibatch_gd_or_adam;
L.train_gd                            = @train_gd;
L.train_adam                          = @train_adam;
L.train_with_algorithm                = @train_with_algorithm;
L.train_bfgs                          = @train_bfgs;

% 8. AFINACAO DO LEARNING RATE
L.tune_learning_rate                  = @tune_learning_rate;
L.choose_best_learning_rate           = @choose_best_learning_rate;
L.merge_tuning_results                = @merge_tuning_results;
L.plot_learning_rate_tuning           = @plot_learning_rate_tuning;
L.print_to_screen_and_file            = @print_to_screen_and_file;
L.print_and_log                       = @print_and_log;

% 9. EXPERIENCIAS FINAIS
L.train_algorithm_runs                = @train_algorithm_runs;
L.save_result_to_mat                  = @save_result_to_mat;
L.load_results_from_mat               = @load_results_from_mat;

% 10. RESULTADOS
L.plot_training_curves                = @plot_training_curves;
L.quantile_per_row                    = @quantile_per_row;
L.print_summary_table                 = @print_summary_table;
L.plot_test_rmse_boxplots             = @plot_test_rmse_boxplots;
L.select_representative_run           = @select_representative_run;
L.plot_predicted_vs_measured          = @plot_predicted_vs_measured;
L.plot_forecast_vs_observed           = @plot_forecast_vs_observed;
L.plot_residual_histogram             = @plot_residual_histogram;

% 11. PIPELINE GENERICO - MODELACAO
L.check_architectures_and_gradients   = @check_architectures_and_gradients;
L.tune_learning_rates                 = @tune_learning_rates;
L.run_final_experiments               = @run_final_experiments;
L.save_algorithm_result               = @save_algorithm_result;
L.report_results                      = @report_results;
L.print_algorithm_comparison          = @print_algorithm_comparison;
L.time_to_reach_best_val              = @time_to_reach_best_val;
L.wilcoxon_signed_rank                = @wilcoxon_signed_rank;
L.rank_values                         = @rank_values;
L.plot_algorithm_comparison           = @plot_algorithm_comparison;

% UTILITARIOS
L.save_figure_png                     = @save_figure_png;
L.add_figure_title                    = @add_figure_title;
L.blue_white_red_colormap             = @blue_white_red_colormap;
L.draw_reference_lines                = @draw_reference_lines;
L.compute_boxplot_stats               = @compute_boxplot_stats;
L.draw_boxplot                        = @draw_boxplot;
L.compute_normal_curve                = @compute_normal_curve;
L.quantile_linear                     = @quantile_linear;
L.skewness_value                      = @skewness_value;
end


% =====================================================================
%  0. PIPELINE GENERICO (as mesmas funcoes para qualquer CSV)
% =====================================================================
% cfg (estrutura que descreve o dataset):
%   obrigatorios: name (texto, usado nas figuras e nos ficheiros de resultados)
%                 file (caminho do CSV)
%   opcionais   : target   indice ou nome (parte do nome) da coluna alvo
%                          (por omissao: a ultima coluna numerica que nao e data)
%                 names    nomes curtos de TODAS as colunas do CSV, pela ordem
%                 units    unidades de todas as colunas (texto)
%                 budget   orcamento em epoch-equivalentes (1000)
%                 -- regressao estatica --
%                 removeDuplicates (true), nonNegative (false)
%                 groupCols   colunas que identificam o mesmo "objeto" (ex.: a
%                             mesma mistura) para discutir a divisao aleatoria
%                 logCols     colunas a substituir por log(x)
%                 ratios      {num, den; ...} pares de colunas para novas razoes
%                 -- serie temporal --
%                 questionAsMinus ('?' no lugar do sinal de menos, true)
%                 jumpK (4), validRange ([-Inf Inf]), maxP (30), calendar (true)

function v = get_config_field(cfg, field, default)
% Campo opcional da configuracao (com valor por omissao).
if isfield(cfg, field) && ~isempty(cfg.(field)), v = cfg.(field); else v = default; end
end

function j = find_column_index(names, key)
% Indice de uma coluna dado o indice ou parte do nome (sem distinguir maiusculas).
if isnumeric(key), j = key; return; end
j = find(strcmpi(names, key), 1);
if isempty(j)
    for k = 1:numel(names)
        if ~isempty(strfind(lower(names{k}), lower(key))), j = k; return; end
    end
    error('Coluna nao encontrada: %s', key);
end
end

function idx = find_column_indices(names, keys)
% Varios indices (keys: vetor numerico, texto ou cell de textos).
if isempty(keys), idx = []; return; end
if isnumeric(keys), idx = keys(:)'; return; end
if ischar(keys), keys = {keys}; end
idx = zeros(1, numel(keys));
for k = 1:numel(keys), idx(k) = find_column_index(names, keys{k}); end
end

function D = load_dataset(cfg)
% Le o CSV de cfg.file e organiza-o:
%   D.isTS  : true se houver uma coluna de datas (serie temporal)
%   estatico: D.X (n x d inputs), D.y (n x 1 alvo), D.names, D.units
%   serie   : D.date (datenum), D.y (serie do alvo), D.X vazio
%   D.targetName, D.unit, D.longNames (cabecalho original), D.info
[hdr, A, isDate, info] = read_csv(cfg.file, get_config_field(cfg, 'questionAsMinus', true));
nCol = numel(hdr);
names = get_config_field(cfg, 'names', {});
if numel(names) ~= nCol
    names = cell(1, nCol);
    for j = 1:nCol                    % nome curto: texto antes do 1o '(', sem espacos
        h = hdr{j};
        p = find(h == '(', 1);
        if ~isempty(p), h = h(1:p-1); end
        h = strtrim(h);  h(h == ' ') = [];
        if isempty(h), h = 'col'; end
        names{j} = h(1:min(14, end));
    end
end
units = get_config_field(cfg, 'units', repmat({''}, 1, nCol));
textCols = find(info.isText);
for j = textCols
    fprintf('  aviso: a coluna "%s" tem texto e foi ignorada\n', hdr{j});
end
dateCol = find(isDate, 1);
valCols = setdiff(1:nCol, [dateCol textCols]);
if isfield(cfg, 'target'), t = find_column_index(names, cfg.target); else t = valCols(end); end
D.cfg = cfg;
D.name = cfg.name;
D.longNames = hdr;
D.info = info;
D.isTS = ~isempty(dateCol);
D.targetName = names{t};
D.unit = units{t};
D.y = A(:, t);
if D.isTS
    D.date = A(:, dateCol);
    D.X = zeros(size(A, 1), 0);
    D.names = {};  D.units = {};
    D.fixedRows = info.fixedRows;
    if numel(valCols) > 1
        fprintf('  aviso: serie temporal - so a coluna alvo "%s" e usada\n', names{t});
    end
else
    inCols = setdiff(valCols, t);
    D.X = A(:, inCols);
    D.names = names(inCols);
    D.units = units(inCols);
    D.colMap = inCols;                    % coluna do CSV de cada input
end
end

function describe_dataset(D)
% Descricao do dataset e estatisticas descritivas dos dados brutos.
% Comeca com um cabecalho grande, para separar bem os datasets no output.
sep = repmat(' === ', 1, 9);
fprintf('\n\n%s\n', sep);
fprintf(' ===  ===  ===  %s  ===  ===  ===\n', upper(D.name));
fprintf('%s\n\n', sep);
fprintf('Ficheiro: %s | separador ''%s'' | linhas ignoradas (nao sao dados): %d\n', ...
        D.cfg.file, D.info.delim, D.info.nIgnored);
fprintf('Colunas do CSV:\n');
for j = 1:numel(D.longNames)
    fprintf('  %d. %s\n', j, D.longNames{j});
end
if D.isTS
    fprintf('Serie temporal: %d valores de %s a %s | alvo: %s (%s) no instante t+1\n', ...
            numel(D.y), datestr(min(D.date), 'yyyy-mm-dd'), datestr(max(D.date), 'yyyy-mm-dd'), ...
            D.targetName, D.unit);
    print_descriptive_stats(D.y, {D.targetName}, {D.unit}, [D.name ' - dados brutos']);
else
    fprintf('Regressao estatica: %d observacoes | %d inputs | alvo: %s (%s)\n', ...
            size(D.X, 1), size(D.X, 2), D.targetName, D.unit);
    print_descriptive_stats([D.X D.y], [D.names {D.targetName}], [D.units {D.unit}], [D.name ' - dados brutos']);
end
end

function [D, R] = clean_dataset(D)
% Limpeza (nao usa estatisticas dos dados, pode ser feita antes da divisao).
% Estatico: remove linhas com NaN, com negativos (se cfg.nonNegative) e linhas
%   repetidas (inputs e alvo iguais; cfg.removeDuplicates). Se cfg.groupCols
%   existir, D.groupId identifica o mesmo objeto (ex.: a mesma mistura).
% Serie: ordena por data, remove datas repetidas, completa o calendario (o passo
%   e o mais comum entre datas; instantes em falta e NaN por interpolacao
%   linear) e assinala, sem alterar, saltos
%   |y(t)-y(t-1)| > jumpK * desvio das diferencas e valores fora de validRange.
cfg = D.cfg;
if D.isTS
    [D, R] = clean_time_series(D, get_config_field(cfg, 'jumpK', 4), get_config_field(cfg, 'validRange', [-Inf Inf]));
    print_descriptive_stats(D.y, {D.targetName}, {D.unit}, [D.name ' - depois da limpeza']);
else
    [D, R] = clean_static_data(D, get_config_field(cfg, 'removeDuplicates', true), ...
                          get_config_field(cfg, 'nonNegative', false), get_config_field(cfg, 'groupCols', []));
    print_descriptive_stats([D.X D.y], [D.names {D.targetName}], [D.units {D.unit}], [D.name ' - depois da limpeza']);
end
end

function run_exploratory_analysis(D, R, figDir)
% Analise exploratoria. Estatico: histogramas, matriz de correlacao, inputs vs
% alvo. Serie: serie completa, distribuicao, comportamento mensal, ciclo anual,
% ACF/PACF (implementadas de raiz) e y(t) contra y(t+1). Figuras em figDir.
pre = lower(D.name);
if ~D.isTS
    cfg = D.cfg;
    logCols = find_column_indices(D.names, get_config_field(cfg, 'logCols', []));
    plot_histograms([D.X D.y], [D.names {D.targetName}], [D.units {D.unit}], [D.name ' - histogramas']);
    save_figure_png([pre '_histogramas'], figDir);
    C = plot_correlation_heatmap([D.X D.y], [D.names {D.targetName}], [D.name ' - matriz de correlacao (Pearson)']);
    save_figure_png([pre '_correlacao'], figDir);
    plot_inputs_vs_target(D.X, D.y, D.names, D.units, [D.targetName ' (' D.unit ')'], logCols);
    save_figure_png([pre '_scatter_target'], figDir);
    [rs, ord] = sort(abs(C(1:end-1, end)), 'descend');
    fprintf('\n%s - correlacao de cada input com %s (por |r|):\n', D.name, D.targetName);
    for k = 1:numel(ord)
        fprintf('  %-14s r = %+.3f\n', D.names{ord(k)}, C(ord(k), end));
    end
    return;
end
yn = D.targetName;
period = round(365.25 / R.step);                  % instantes num ano
spanYears = (D.date(end) - D.date(1)) / 365.25;
plot_time_series(D.date, D.y, D.filled, R.jumpIdx, R.fixedIdx, D.unit, yn, ...
            sprintf('%s - %s', D.name, yn), get_config_field(D.cfg, 'jumpK', 4));
save_figure_png([pre '_serie'], figDir);
plot_distribution(D.y, D.unit, yn);
save_figure_png([pre '_distribuicao'], figDir);
if spanYears >= 1                                 % sazonalidade so com pelo menos um ano
    plot_monthly_boxplots(D.date, D.y, D.unit, yn);
    save_figure_png([pre '_mensal'], figDir);
    plot_annual_cycle(D.date, D.y, D.unit, yn);
    save_figure_png([pre '_ciclo_anual'], figDir);
end
maxLag = get_config_field(D.cfg, 'maxP', 30);
nLong = max(maxLag, min(3 * period, floor(numel(D.y) / 2)));
plot_acf_pacf(D.y, maxLag, nLong, period);
save_figure_png([pre '_acf_pacf'], figDir);
plot_lag1_scatter(D.y, D.unit, yn);
save_figure_png([pre '_lag_scatter'], figDir);

r  = compute_acf(D.y, maxLag);
ph = compute_pacf(D.y, maxLag);
band = 1.96 / sqrt(numel(D.y));
fprintf('\n%s - ACF e PACF (banda de significancia +/- %.3f):\n', D.name, band);
fprintf('  lag   ACF     PACF\n');
for k = 1:min(14, maxLag)
    s = ''; if abs(ph(k)) > band, s = '*'; end
    fprintf('  %3d  %6.3f  %6.3f %s\n', k, r(k + 1), ph(k), s);
end
if numel(D.y) > 2 * period && period >= 2
    rY = compute_acf(D.y, period);
    h = round(period / 2);
    fprintf('  ACF no lag %d (meio ano): %.3f | no lag %d (um ano): %.3f\n', h, rY(h + 1), period, rY(period + 1));
end
dv = datevec(D.date);
yrs = unique(dv(:, 1));
fprintf('\n%s - por ano:\n', D.name);
for k = 1:numel(yrs)
    sel = dv(:, 1) == yrs(k);
    fprintf('  %d: media %.2f | min %.1f | max %.1f %s\n', yrs(k), mean(D.y(sel)), ...
            min(D.y(sel)), max(D.y(sel)), D.unit);
end
fprintf('Saltos bruscos assinalados:\n');
for k = 1:numel(R.jumpIdx)
    j = R.jumpIdx(k);
    fprintf('  %s: %.1f -> %.1f %s\n', datestr(D.date(j), 'yyyy-mm-dd'), D.y(j-1), D.y(j), D.unit);
end
end

function F = create_features(D, fracs, seed, figDir)
% Feature engineering. Devolve F.X, F.y, F.names (e F.dates numa serie).
% Estatico: aplica cfg.logCols (x -> log x) e cfg.ratios (novas colunas
%   num/den) e compara, na VALIDACAO, a regressao linear com os inputs
%   originais e com os novos (a mesma divisao que sera usada depois).
% Serie: janela dos p valores anteriores + sin/cos do dia do ano (se
%   cfg.calendar). p escolhido na VALIDACAO (divisao cronologica) com um AR
%   linear: o menor p com RMSE a menos de 0.5% do melhor. Para todos os p os
%   alvos sao os mesmos (comecam em maxP+1), por isso os erros sao comparaveis.
cfg = D.cfg;
if ~D.isTS
    X0 = D.X;  X = X0;  names = D.names;
    logCols = find_column_indices(D.names, get_config_field(cfg, 'logCols', []));
    for c = logCols
        X(:, c) = log(X0(:, c));
        names{c} = ['log' D.names{c}];
    end
    ratios = get_config_field(cfg, 'ratios', {});
    for k = 1:size(ratios, 1)
        a = find_column_index(D.names, ratios{k, 1});  b = find_column_index(D.names, ratios{k, 2});
        X = [X, X0(:, a) ./ X0(:, b)];
        names{end + 1} = [D.names{a} '/' D.names{b}];
    end
    F.X = X;  F.y = D.y;  F.names = names;  F.dates = [];
    if size(X, 2) > size(X0, 2) || ~isempty(logCols)
        I = split_random(size(X, 1), fracs, seed);
        fprintf('\n%s - features novas (r com %s):\n', D.name, D.targetName);
        for c = [logCols, size(X0, 2) + 1:size(X, 2)]
            cc = compute_correlation_matrix([X(:, c) D.y]);
            fprintf('  %-14s r = %+.3f\n', names{c}, cc(1, 2));
        end
        fprintf('%s - regressao linear na VALIDACAO (justificacao das features):\n', D.name);
        XX = {X0, X};  lbl = {sprintf('%d inputs originais', size(X0, 2)), ...
                              sprintf('%d inputs com features novas', size(X, 2))};
        for k = 1:2
            w = fit_linear_regression(XX{k}(I.tr, :), D.y(I.tr));
            mv = compute_regression_metrics(D.y(I.va), predict_linear_regression(w, XX{k}(I.va, :)));
            fprintf('  %-32s RMSE %8.3f %s | R2 %6.3f\n', lbl{k}, mv.rmse, D.unit, mv.r2);
        end
    end
    fprintf('%s - inputs finais (d = %d): %s\n', D.name, size(X, 2), sprintf('%s ', names{:}));
    return;
end
maxP = get_config_field(cfg, 'maxP', 30);
useCal = get_config_field(cfg, 'calendar', true);
pList = 1:maxP;
rmseP = zeros(maxP, 2);                          % [sem calendario, com calendario]
for k = 1:maxP
    for cal = [false true]
        [Xw, yw] = create_lag_windows(D.y, D.date, k, cal, maxP + 1);
        Iw = split_chronological(numel(yw), fracs);
        w = fit_linear_regression(Xw(Iw.tr, :), yw(Iw.tr));
        mv = compute_regression_metrics(yw(Iw.va), predict_linear_regression(w, Xw(Iw.va, :)));
        rmseP(k, cal + 1) = mv.rmse;
    end
end
[Xw, yw] = create_lag_windows(D.y, D.date, 1, false, maxP + 1);
Iw = split_chronological(numel(yw), fracs);
rmsePers = sqrt(mean((yw(Iw.va) - Xw(Iw.va, 1)) .^ 2));
col = 1 + useCal;
best = min(rmseP(:, col));
pSel = pList(find(rmseP(:, col) <= 1.005 * best, 1));
fprintf('\n%s - AR linear na validacao (RMSE em %s), persistencia = %.3f\n', D.name, D.unit, rmsePers);
fprintf('    p   sem calend.  com calend.\n');
for k = unique([1:min(10, maxP) 14 21 maxP])
    if k <= maxP, fprintf('  %3d     %6.3f       %6.3f\n', k, rmseP(k, 1), rmseP(k, 2)); end
end
fprintf('  melhor RMSE: %.3f (p = %d) -> escolhido p = %d (a 0.5%% do melhor)\n', ...
        best, pList(find(rmseP(:, col) == best, 1)), pSel);
plot_window_size_selection(pList, rmseP, rmsePers, pSel, D.unit, col);
save_figure_png([lower(D.name) '_escolha_p'], figDir);
[F.X, F.y, F.dates, F.names] = create_lag_windows(D.y, D.date, pSel, useCal, maxP + 1, D.targetName);
F.pSel = pSel;
fprintf('%s - inputs finais (d = %d): %s\n', D.name, size(F.X, 2), sprintf('%s ', F.names{:}));
end

function I = split_train_val_test(D, F, fracs, seed, figDir)
% Divisao treino / validacao / teste. Serie: cronologica (sem fuga do futuro).
% Estatico: aleatoria com a seed; se houver grupos (cfg.groupCols) mostra
% quantos grupos do teste tambem aparecem no treino (para a discussao).
n = numel(F.y);
if D.isTS
    I = split_chronological(n, fracs);
    fprintf('\n%s - divisao cronologica %d/%d/%d (%d amostras):\n', D.name, round(100 * fracs), n);
    blk = {'treino', 'validacao', 'teste'};  ids = {I.tr, I.va, I.te};
    for b = 1:3
        fprintf('  %-10s %4d alvos: %s a %s\n', blk{b}, numel(ids{b}), ...
                datestr(F.dates(ids{b}(1)), 'yyyy-mm-dd'), datestr(F.dates(ids{b}(end)), 'yyyy-mm-dd'));
    end
    plot_chronological_split(F.dates, F.y, I, D.unit, D.targetName, D.name);
    save_figure_png([lower(D.name) '_divisao'], figDir);
    return;
end
I = split_random(n, fracs, seed);
fprintf('\n%s - divisao aleatoria %d/%d/%d (seed %d): treino %d | validacao %d | teste %d\n', ...
        D.name, round(100 * fracs), seed, numel(I.tr), numel(I.va), numel(I.te));
if isfield(D, 'groupId')
    gTe = unique(D.groupId(I.te));
    gTr = unique(D.groupId(I.tr));
    shared = ismember(gTe, gTr);
    fprintf('  grupos no teste: %d, dos quais %d (%.0f%%) tambem aparecem no treino\n', ...
            numel(gTe), sum(shared), 100 * mean(shared));
    fprintf('  linhas de teste cujo grupo esta no treino: %.0f%%\n', ...
            100 * mean(ismember(D.groupId(I.te), gTr)));
    Ig = split_random_by_group(D.groupId, fracs, seed);
    fprintf('  (divisao por grupo, para comparacao: treino %d | validacao %d | teste %d)\n', ...
            numel(Ig.tr), numel(Ig.va), numel(Ig.te));
end
end

function REF = fit_baseline_models(D, P)
% Modelos de referencia, ajustados so no treino.
% Estatico: regressao linear. Serie: persistencia y(t+1) = y(t) e AR linear na
% mesma janela (com os mesmos inputs da rede).
REF.w = fit_linear_regression(P.XtrRaw, P.ytrRaw);
if D.isTS
    REF.names = {'persistencia', 'AR linear'};
else
    REF.names = {'regressao linear'};
end
end

function REF = evaluate_baseline_models(D, REF, P, fid)
% Avalia as referencias no TESTE (unidades originais) e escreve-as em fid.
if D.isTS
    REF.pred = {P.XteRaw(:, 1), predict_linear_regression(REF.w, P.XteRaw)};
else
    REF.pred = {predict_linear_regression(REF.w, P.XteRaw)};
end
REF.rmse = zeros(1, numel(REF.pred));
txt = sprintf('\n%s - modelos de referencia no teste:\n', D.name);
for k = 1:numel(REF.pred)
    m = compute_regression_metrics(P.yteRaw, REF.pred{k});
    REF.rmse(k) = m.rmse;
    txt = [txt sprintf('  %-17s RMSE %.3f %s | MAE %.3f | R2 %.3f\n', REF.names{k}, m.rmse, D.unit, m.mae, m.r2)];
end
print_to_screen_and_file(txt, fid);
end

function plot_test_predictions(D, P, Es, REF, N, figDir)
% Previsoes no teste do modelo representativo (combinacao e run escolhidas so
% pela validacao): estatico -> previsto contra medido; serie -> observado e
% previsto ao longo do teste com uma ampliacao. Mais o histograma dos residuos.
[algs, nmAlg] = get_algorithm_list();  archs = get_architecture_ids();
[a, g, r] = select_representative_run(Es);
[lay, nmArch] = get_architecture_layers(archs{a}, P.d, N);
yh = Es{a}.(algs{g}).yhat(:, r);
ttl = sprintf('%s - %s, %s, run %d (escolhido pela validacao)', D.name, nmArch, nmAlg{g}, r);
if D.isTS
    plot_forecast_vs_observed(P.date(P.I.te), P.yteRaw, yh, REF.pred{1}, 60, D.targetName, D.unit, ttl);
else
    plot_predicted_vs_measured(P.yteRaw, yh, D.targetName, D.unit, ttl);
end
save_figure_png(['previsoes_' lower(D.name)], figDir);
end


% =====================================================================
%  1. LEITURA DE CSV (generica)
% =====================================================================

function [header, A, isDate, info] = read_csv(filename, questionAsMinus)
% Le um CSV numerico qualquer.
%  - separador detetado na 1a linha (o mais frequente fora de aspas: , ; tab)
%  - se o cabecalho estiver colado a 1a linha de dados (texto depois da ultima
%    aspa da 1a linha, por falta de quebra de linha), esse texto passa a ser dados
%  - datas yyyy-mm-dd ou dd/mm/yyyy -> datenum (isDate = true nessa coluna)
%  - virgula decimal quando o separador nao e a virgula
%  - '?' num numero: sinal de menos perdido (questionAsMinus) ou removido
%  - linhas com outro numero de campos (titulos, rodapes) sao ignoradas
%  - colunas com texto ficam com NaN e info.isText = true
% info: delim, nIgnored, fixedRows (linhas com '?'), isText
if nargin < 2, questionAsMinus = true; end
txt = fileread(filename);
txt(txt == char(13)) = [];
nl = find(txt == char(10), 1);
if isempty(nl), nl = numel(txt) + 1; end
first = txt(1:nl-1);

outside = first;  inq = false;
for k = 1:numel(first)
    if first(k) == '"', inq = ~inq; elseif inq, outside(k) = ' '; end
end
cands = {',', ';', char(9)};
cnt = zeros(1, 3);
for k = 1:3, cnt(k) = sum(outside == cands{k}); end
[mx, kd] = max(cnt);
delim = cands{kd};

q = find(first == '"');
rest = '';
if ~isempty(q) && ~isempty(strtrim(first(q(end)+1:end)))
    rest = first(q(end)+1:end);
    first = first(1:q(end));
end
header = split_csv_line(first, delim);
for j = 1:numel(header)
    h = header{j};  h(h == '"') = [];
    header{j} = strtrim(regexprep(h, '\s+', ' '));
end
nC = numel(header);

body = txt(min(nl + 1, numel(txt) + 1):end);
if ~isempty(rest), body = [rest char(10) body]; end
lines = regexp(body, '[^\n]+', 'match');
nL = numel(lines);
A = nan(nL, nC);
keep = false(nL, 1);  fixed = false(nL, 1);
isDate = false(1, nC);  isText = false(1, nC);
for i = 1:nL
    f = split_csv_line(lines{i}, delim);
    if numel(f) ~= nC, continue; end
    for j = 1:nC
        s = strtrim(f{j});  s(s == '"') = [];
        if isempty(s), continue; end
        tk = regexp(s, '^(\d{4})-(\d{1,2})-(\d{1,2})$', 'tokens');
        if isempty(tk)
            tk = regexp(s, '^(\d{1,2})/(\d{1,2})/(\d{4})$', 'tokens');
            if ~isempty(tk), tk = {{tk{1}{3}, tk{1}{2}, tk{1}{1}}}; end
        end
        if ~isempty(tk)
            A(i, j) = datenum(str2double(tk{1}{1}), str2double(tk{1}{2}), str2double(tk{1}{3}));
            isDate(j) = true;
            continue;
        end
        if ~strcmp(delim, ','), s(s == ',') = '.'; end
        if any(s == '?')
            fixed(i) = true;
            if questionAsMinus, s(s == '?') = '-'; else s(s == '?') = []; end
        end
        v = str2double(s);
        if isnan(v), isText(j) = true; end
        A(i, j) = v;
    end
    keep(i) = true;
end
A = A(keep, :);
fixed = fixed(keep);
info.delim = delim;
if strcmp(delim, char(9)), info.delim = 'tab'; end
info.nIgnored = sum(~keep);
info.fixedRows = find(fixed);
info.isText = isText & ~isDate;
end

function f = split_csv_line(s, delim)
% Divide uma linha pelo separador, respeitando campos entre aspas.
f = {};  inq = false;  start = 1;
for k = 1:numel(s)
    c = s(k);
    if c == '"'
        inq = ~inq;
    elseif c == delim && ~inq
        f{end + 1} = s(start:k-1);
        start = k + 1;
    end
end
f{end + 1} = s(start:end);
end


% =====================================================================
%  2. INSPECAO E LIMPEZA
% =====================================================================

function S = print_descriptive_stats(X, names, units, titleStr)
% Estatisticas descritivas de cada coluna de X (ignora NaN).
% Devolve S (p-by-10): [n nNaN min Q1 mediana media Q3 max desvio assimetria]
if nargin < 3 || isempty(units), units = repmat({''}, 1, size(X, 2)); end
if nargin < 4, titleStr = 'Estatisticas descritivas'; end
p = size(X, 2);
S = zeros(p, 10);
fprintf('\n%s\n', titleStr);
fprintf('%-14s %-6s %5s %4s %9s %9s %9s %9s %9s %9s %8s %6s\n', 'Variavel', 'Unid.', ...
        'n', 'NaN', 'min', 'Q1', 'mediana', 'media', 'Q3', 'max', 'desvio', 'skew');
for j = 1:p
    x = X(:, j);
    nNaN = sum(isnan(x));
    x = sort(x(~isnan(x)));
    S(j, :) = [numel(x), nNaN, x(1), quantile_linear(x, 0.25), quantile_linear(x, 0.5), mean(x), ...
               quantile_linear(x, 0.75), x(end), std(x), skewness_value(x)];
    fprintf('%-14s %-6s %5d %4d %9.2f %9.2f %9.2f %9.2f %9.2f %9.2f %8.2f %6.2f\n', ...
            names{j}, units{j}, S(j, 1), S(j, 2), S(j, 3:10));
end
end

function [D, R] = clean_static_data(D, removeDuplicates, nonNegative, groupCols)
% Limpeza de um dataset estatico (ver clean_dataset).
A = [D.X D.y];
R.nInitial = size(A, 1);
bad = any(isnan(A), 2);
R.nNaN = sum(bad);
if nonNegative, neg = any(A < 0, 2) & ~bad; else neg = false(size(bad)); end
R.nNegative = sum(neg);
keep = ~bad & ~neg;

% repetidas: sortrows e estavel, por isso fica a primeira ocorrencia original
idx = find(keep);
[As, ord] = sortrows(A(idx, :));
same = [false; all(diff(As, 1, 1) == 0, 2)];
dup = false(size(A, 1), 1);
dup(idx(ord(same))) = true;
R.nDuplicates = sum(dup);
if removeDuplicates, keep = keep & ~dup; end

D.X = D.X(keep, :);
D.y = D.y(keep);
R.nFinal = size(D.X, 1);

[u2, i2, inpId] = unique(D.X, 'rows');
cnt2 = accumarray(inpId(:), 1);
R.nReplicateRows = sum(cnt2(inpId) > 1);

fprintf('\nLimpeza %s: %d linhas iniciais\n', D.name, R.nInitial);
fprintf('  com NaN: %d | com valores negativos: %d | repetidas (inputs+alvo): %d', ...
        R.nNaN, R.nNegative, R.nDuplicates);
if removeDuplicates, fprintf(' -> removidas\n'); else fprintf(' -> mantidas\n'); end
fprintf('  linhas finais: %d\n', R.nFinal);
fprintf('  linhas com os mesmos inputs e alvo diferente (replicas): %d\n', R.nReplicateRows);

gc = find_column_indices(D.names, groupCols);
if ~isempty(gc)
    [u, i1, gid] = unique(D.X(:, gc), 'rows');
    cnt = accumarray(gid(:), 1);
    D.groupId = gid(:);
    R.nGroups = size(u, 1);
    R.nGroupsMulti = sum(cnt > 1);
    R.nRowsInMulti = sum(cnt(gid) > 1);
    fprintf('  grupos (%s): %d | grupos com varias linhas: %d (%d linhas, %.0f%%)\n', ...
            sprintf('%s ', D.names{gc}), R.nGroups, R.nGroupsMulti, R.nRowsInMulti, ...
            100 * R.nRowsInMulti / R.nFinal);
end
end

function [D, R] = clean_time_series(D, jumpK, validRange)
% Limpeza de uma serie temporal (ver clean_dataset).
R.nInitial = numel(D.y);
fixedDates = D.date(D.fixedRows);
[d, ord] = sort(D.date);
T = D.y(ord);
dupDate = [false; diff(d) == 0];
R.nDuplicateDates = sum(dupDate);
d = d(~dupDate);
T = T(~dupDate);

step = median(diff(d));                         % passo da serie (1 = diario)
R.step = step;
pos = round((d - d(1)) / step) + 1;
allDays = d(1) + (0:pos(end) - 1)' * step;
R.missingDates = allDays(setdiff(1:pos(end), pos));
R.nMissingDays = numel(R.missingDates);
R.nNaN = sum(isnan(T));

Tfull = nan(numel(allDays), 1);
Tfull(pos) = T;
filled = isnan(Tfull);
ok = ~filled;
Tfull(filled) = interp1(allDays(ok), Tfull(ok), allDays(filled), 'linear');

dT = diff(Tfull);
thr = jumpK * std(dT);
R.jumpThreshold = thr;
R.jumpIdx = find(abs(dT) > thr) + 1;
R.outOfRangeIdx = find(Tfull < validRange(1) | Tfull > validRange(2));
R.fixedIdx = round((fixedDates - d(1)) / step) + 1;

D.date = allDays;
D.y = Tfull;
D.filled = filled;
R.nFinal = numel(Tfull);

fprintf('\nLimpeza %s: %d valores lidos (%s a %s)\n', D.name, R.nInitial, ...
        datestr(allDays(1), 'yyyy-mm-dd'), datestr(allDays(end), 'yyyy-mm-dd'));
fprintf('  valores com ''?'' corrigidos: %d\n', numel(R.fixedIdx));
for k = 1:numel(R.fixedIdx)
    fprintf('     %s  -> %.1f %s\n', datestr(allDays(R.fixedIdx(k)), 'yyyy-mm-dd'), Tfull(R.fixedIdx(k)), D.unit);
end
fprintf('  datas repetidas: %d | valores NaN: %d | datas em falta: %d\n', ...
        R.nDuplicateDates, R.nNaN, R.nMissingDays);
for k = 1:R.nMissingDays
    j = round((R.missingDates(k) - d(1)) / step) + 1;
    fprintf('     %s preenchido por interpolacao -> %.2f %s\n', ...
            datestr(R.missingDates(k), 'yyyy-mm-dd'), Tfull(j), D.unit);
end
fprintf('  saltos bruscos (|dy| > %.1f*desvio = %.2f %s): %d (assinalados, nao alterados)\n', ...
        jumpK, thr, D.unit, numel(R.jumpIdx));
fprintf('  valores fora de [%g, %g]: %d\n', validRange(1), validRange(2), numel(R.outOfRangeIdx));
fprintf('  serie final: %d instantes consecutivos\n', R.nFinal);
end

% =====================================================================
%  3. EDA - GRAFICOS GERAIS
% =====================================================================

function plot_histograms(X, names, units, titleStr)
% Histograma de cada coluna de X (30 classes), com a media (linha vermelha) e
% a mediana (tracejado). O titulo mostra a assimetria.
if nargin < 4, titleStr = 'Histogramas'; end
p = size(X, 2);
nc = ceil(sqrt(p));  nr = ceil(p / nc);
figure('Name', titleStr, 'Color', 'w', 'Position', [40 40 1200 800]);
cols = lines(max(p, 7));
for j = 1:p
    x = X(~isnan(X(:, j)), j);
    subplot(nr, nc, j);
    [cnt, ctr] = hist(x, 30);
    bar(ctr, cnt, 1, 'FaceColor', cols(mod(j-1, size(cols,1)) + 1, :), 'EdgeColor', 'w');
    hold on;
    yl = get(gca, 'YLim');
    plot([mean(x) mean(x)], yl, 'r-', 'LineWidth', 1.5);
    plot([median(x) median(x)], yl, 'k--', 'LineWidth', 1.2);
    hold off;
    title(sprintf('%s  (skew = %.2f)', names{j}, skewness_value(x)), 'FontSize', 9);
    xlabel(units{j}, 'FontSize', 8);
    ylabel('frequencia', 'FontSize', 8);
    set(gca, 'FontSize', 8);
end
add_figure_title(sprintf('%s   (vermelho = media, tracejado = mediana)', titleStr));
end

function C = compute_correlation_matrix(X)
% Matriz de correlacao de Pearson entre as colunas de X.
n = size(X, 1);
sd = std(X, 1);
sd(sd == 0) = Inf;
Z = (X - repmat(mean(X), n, 1)) ./ repmat(sd, n, 1);
C = (Z' * Z) / n;
C(1:size(C, 1) + 1:end) = 1;
end

function C = plot_correlation_heatmap(X, names, titleStr)
% Mapa de calor da correlacao de Pearson (azul = negativa, vermelho = positiva).
if nargin < 3, titleStr = 'Matriz de correlacao'; end
C = compute_correlation_matrix(X);
p = numel(names);
figure('Name', titleStr, 'Color', 'w', 'Position', [80 60 800 700]);
imagesc(C, [-1 1]);
colormap(blue_white_red_colormap(64));
colorbar;
axis square;
set(gca, 'XTick', 1:p, 'XTickLabel', names, 'YTick', 1:p, 'YTickLabel', names, 'FontSize', 8);
for i = 1:p
    for j = 1:p
        if abs(C(i, j)) > 0.6, tc = 'w'; else tc = 'k'; end
        text(j, i, sprintf('%.2f', C(i, j)), 'HorizontalAlignment', 'center', ...
             'FontSize', 8, 'Color', tc);
    end
end
title(titleStr, 'FontSize', 11);
end

function plot_inputs_vs_target(X, y, names, units, yName, logCols)
% Scatter de cada input contra o target, com o coeficiente de correlacao r.
% logCols : indices das colunas a mostrar com eixo x logaritmico (ex.: Age).
if nargin < 6, logCols = []; end
p = size(X, 2);
nc = ceil(sqrt(p));  nr = ceil(p / nc);
figure('Name', ['Inputs vs ' yName], 'Color', 'w', 'Position', [40 40 1200 800]);
for j = 1:p
    subplot(nr, nc, j);
    c = compute_correlation_matrix([X(:, j) y]);
    if any(logCols == j)
        semilogx(X(:, j), y, '.', 'MarkerSize', 6);
        xl = [units{j} ' (escala log)'];
    else
        plot(X(:, j), y, '.', 'MarkerSize', 6);
        xl = units{j};
    end
    grid on;
    title(sprintf('%s  (r = %.2f)', names{j}, c(1, 2)), 'FontSize', 9);
    xlabel(xl, 'FontSize', 8);
    ylabel(yName, 'FontSize', 8);
    set(gca, 'FontSize', 8);
end
add_figure_title(['Cada input contra ' yName]);
end


% =====================================================================
%  3. EDA - SERIES TEMPORAIS
% =====================================================================

function r = compute_acf(x, maxLag)
% Funcao de autocorrelacao (implementada de raiz):
%   r(k) = sum_{t=1}^{n-k} (x_t - m)(x_{t+k} - m) / sum_{t=1}^{n} (x_t - m)^2
% Devolve r(1..maxLag+1) para os lags 0..maxLag (r(1) = 1).
x = x(:) - mean(x);
n = numel(x);
den = sum(x .^ 2);
r = zeros(maxLag + 1, 1);
for k = 0:maxLag
    r(k + 1) = sum(x(1:n-k) .* x(1+k:n)) / den;
end
end

function phi = compute_pacf(x, maxLag)
% Autocorrelacao parcial pela recursao de Durbin-Levinson (a partir da ACF).
% phi(k) = correlacao entre x_t e x_{t-k} descontando os lags 1..k-1.
% Ajuda a escolher o numero de lags p da janela.
r = compute_acf(x, maxLag);
r = r(2:end);                       % lags 1..maxLag
phi = zeros(maxLag, 1);
a = zeros(maxLag, 1);               % coeficientes AR do passo anterior
for k = 1:maxLag
    if k == 1
        ak = r(1);
        aNew = ak;
    else
        num = r(k) - sum(a(1:k-1) .* r(k-1:-1:1));
        den = 1 - sum(a(1:k-1) .* r(1:k-1));
        ak = num / den;
        aNew = [a(1:k-1) - ak * a(k-1:-1:1); ak];
    end
    a(1:k) = aNew;
    phi(k) = ak;
end
end

function plot_time_series(date, y, filled, jumpIdx, fixedIdx, unit, yName, titleStr, jumpK)
% Serie completa (com media movel de 30 instantes) e diferencas y(t)-y(t-1).
% Assinala os instantes preenchidos, os valores com '?' e os saltos bruscos.
if nargin < 6, unit = ''; end
if nargin < 7, yName = 'y'; end
if nargin < 8, titleStr = 'Serie temporal'; end
if nargin < 9, jumpK = 4; end
figure('Name', titleStr, 'Color', 'w', 'Position', [40 60 1250 700]);
subplot(2, 1, 1);
plot(date, y, '-', 'Color', [0.6 0.7 0.9]);
hold on;
w = min(30, floor(numel(y) / 4));
ma = conv(y, ones(w, 1) / w);
ma = ma(w:numel(y));                         % media dos ultimos w instantes
plot(date(w:end), ma, 'b-', 'LineWidth', 1.5);
leg = {'valores', sprintf('media movel %d instantes', w)};
if any(filled)
    plot(date(filled), y(filled), 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 7);
    leg{end+1} = 'instante em falta (interpolado)';
end
if ~isempty(fixedIdx)
    plot(date(fixedIdx), y(fixedIdx), 'ks', 'MarkerFaceColor', 'm', 'MarkerSize', 7);
    leg{end+1} = 'valor com ''?'' (corrigido)';
end
if ~isempty(jumpIdx)
    plot(date(jumpIdx), y(jumpIdx), 'r^', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
    leg{end+1} = 'salto brusco';
end
hold off;
datetick('x', 'yyyy');
xlim([date(1) date(end)]);
grid on;
ylabel(sprintf('%s (%s)', yName, unit));
title(sprintf('%s (%s a %s)', titleStr, datestr(date(1), 'yyyy-mm-dd'), datestr(date(end), 'yyyy-mm-dd')));
legend(leg, 'Location', 'NorthEast');

subplot(2, 1, 2);
dy = [NaN; diff(y)];
plot(date, dy, '-', 'Color', [0.4 0.4 0.4]);
hold on;
if ~isempty(jumpIdx)
    plot(date(jumpIdx), dy(jumpIdx), 'r^', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
end
thr = jumpK * std(dy(2:end));
plot([date(1) date(end)], [thr thr], 'r--', [date(1) date(end)], [-thr -thr], 'r--');
hold off;
datetick('x', 'yyyy');
xlim([date(1) date(end)]);
grid on;
ylabel(sprintf('%s(t) - %s(t-1) (%s)', yName, yName, unit));
title(sprintf('Variacao entre instantes (tracejado = +/- %g desvios = %.1f %s)', jumpK, thr, unit));
end

function plot_distribution(y, unit, yName)
% Histograma com a curva normal (mesma media e desvio) e boxplot por baixo.
if nargin < 2, unit = ''; end
if nargin < 3, yName = 'y'; end
figure('Name', ['Distribuicao de ' yName], 'Color', 'w', 'Position', [100 100 900 600]);
axes('Position', [0.1 0.35 0.85 0.55]);
[cnt, ctr] = hist(y, 40);
bar(ctr, cnt, 1, 'FaceColor', [0.3 0.5 0.8], 'EdgeColor', 'w');
hold on;
xg = linspace(min(y), max(y), 200);
sd = std(y);
plot(xg, compute_normal_curve(xg, mean(y), sd, numel(y), ctr(2) - ctr(1)), 'r-', 'LineWidth', 2);
hold off;
xl = get(gca, 'XLim');
ylabel('frequencia');
title(sprintf('Distribuicao de %s: media %.2f, desvio %.2f, assimetria %.2f', ...
      yName, mean(y), sd, skewness_value(y)), 'Interpreter', 'none');
legend('dados', 'normal com a mesma media e desvio');
grid on;
axes('Position', [0.1 0.1 0.85 0.15]);
s = compute_boxplot_stats(y);
hold on;
draw_boxplot(s, 1, [0.3 0.5 0.8], true, 0.35);
hold off;
set(gca, 'XLim', xl, 'YLim', [0 2], 'YTick', []);
xlabel(sprintf('%s   (%d valores fora de 1.5*IQR)', unit, numel(s.out)));
end

function plot_monthly_boxplots(date, y, unit, yName)
% Comportamento sazonal: boxplot dos valores de cada mes (sem toolbox).
if nargin < 3, unit = ''; end
if nargin < 4, yName = 'y'; end
dv = datevec(date);
mo = dv(:, 2);
names = {'Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'};
figure('Name', 'Comportamento mensal', 'Color', 'w', 'Position', [100 100 1000 550]);
hold on;
cmap = jet(12);
mu = nan(12, 1);
for m = 1:12
    if ~any(mo == m), continue; end
    s = compute_boxplot_stats(y(mo == m));
    draw_boxplot(s, m, cmap(m, :), false, 0.35);
    mu(m) = mean(y(mo == m));
end
ok = ~isnan(mu);
plot(find(ok), mu(ok), 'k-o', 'LineWidth', 1.5, 'MarkerFaceColor', 'k');
hold off;
set(gca, 'XTick', 1:12, 'XTickLabel', names, 'XLim', [0.4 12.6]);
grid on;
ylabel(sprintf('%s (%s)', yName, unit));
title(sprintf('%s por mes (caixa = Q1-Q3, linha = mediana, pontos = outliers 1.5*IQR, preto = media)', yName), ...
      'Interpreter', 'none');
end

function plot_annual_cycle(date, y, unit, yName)
% Ciclo anual: cada ano em cinzento contra o dia do ano, e a media (por dia do
% ano, suavizada com 15 dias) +/- 1 desvio.
if nargin < 3, unit = ''; end
if nargin < 4, yName = 'y'; end
dv = datevec(date);
yr = dv(:, 1);
doy = floor(date - datenum(yr, 1, 1)) + 1;
years = unique(yr);
figure('Name', 'Ciclo anual', 'Color', 'w', 'Position', [100 100 1000 550]);
hold on;
for k = 1:numel(years)
    sel = yr == years(k);
    plot(doy(sel), y(sel), '-', 'Color', [0.82 0.82 0.82]);
end
mu = nan(366, 1);  sd = nan(366, 1);
for d = 1:366
    v = y(doy == d);
    if ~isempty(v), mu(d) = mean(v); sd(d) = std(v); end
end
x = (1:366)';
ok = ~isnan(mu);
mu = interp1(x(ok), mu(ok), x, 'linear', 'extrap');   % dias sem dados (series nao diarias)
sd = interp1(x(ok), sd(ok), x, 'linear', 'extrap');
w = 15;  h = floor(w / 2);
k = ones(w, 1) / w;
muS = conv([mu(end-h+1:end); mu; mu(1:h)], k);  muS = muS(w:w+365);
sdS = conv([sd(end-h+1:end); sd; sd(1:h)], k);  sdS = sdS(w:w+365);
fill([x; flipud(x)], [muS + sdS; flipud(muS - sdS)], [0.75 0.85 1], 'EdgeColor', 'none');
plot(x, muS, 'b-', 'LineWidth', 2.5);
hold off;
xlim([1 366]);
grid on;
xlabel('dia do ano');
ylabel(sprintf('%s (%s)', yName, unit));
title('Ciclo anual: cada ano (cinzento), media por dia do ano (azul) +/- 1 desvio');
end

function plot_acf_pacf(y, maxLagShort, maxLagLong, period)
% ACF ate maxLagShort (para escolher a janela), ACF longa ate maxLagLong e PACF.
% period : numero de instantes num ano (linhas pontilhadas nos seus multiplos).
% Banda de significancia +/- 1.96/sqrt(n).
if nargin < 4, period = []; end
n = numel(y);
band = 1.96 / sqrt(n);
rS = compute_acf(y, maxLagShort);
rL = compute_acf(y, maxLagLong);
ph = compute_pacf(y, maxLagShort);
figure('Name', 'ACF e PACF', 'Color', 'w', 'Position', [40 60 1250 750]);
subplot(2, 2, 1);
stem(0:maxLagShort, rS, 'filled', 'MarkerSize', 4);
hold on; plot([0 maxLagShort], [band band], 'r--', [0 maxLagShort], [-band -band], 'r--'); hold off;
grid on; xlim([-0.5 maxLagShort + 0.5]);
xlabel('lag (instantes)'); ylabel('ACF'); title(sprintf('ACF, lags 0 a %d', maxLagShort));

subplot(2, 2, 2);
stem(1:maxLagShort, ph, 'filled', 'MarkerSize', 4);
hold on; plot([0 maxLagShort], [band band], 'r--', [0 maxLagShort], [-band -band], 'r--'); hold off;
grid on; xlim([0.5 maxLagShort + 0.5]);
xlabel('lag (instantes)'); ylabel('PACF'); title('PACF (Durbin-Levinson)');

subplot(2, 1, 2);
plot(0:maxLagLong, rL, 'b-', 'LineWidth', 1.2);
hold on;
plot([0 maxLagLong], [band band], 'r--', [0 maxLagLong], [-band -band], 'r--');
plot([0 maxLagLong], [0 0], 'k-');
if ~isempty(period)
    for k = period:period:maxLagLong
        plot([k k], [-1 1], 'k:');
    end
end
hold off;
grid on; xlim([0 maxLagLong]); ylim([-1 1]);
xlabel('lag (instantes)'); ylabel('ACF');
if isempty(period)
    title(sprintf('ACF ate %d instantes', maxLagLong));
else
    title(sprintf('ACF ate %d instantes (pontilhado = multiplos de um ano = %d instantes)', maxLagLong, period));
end
end

function plot_lag1_scatter(y, unit, yName)
% Dispersao y(t) contra y(t+1), com a reta y(t+1) = y(t) (persistencia).
if nargin < 2, unit = ''; end
if nargin < 3, yName = 'y'; end
a = y(1:end-1);  b = y(2:end);
c = compute_correlation_matrix([a b]);
figure('Name', [yName '(t) vs ' yName '(t+1)'], 'Color', 'w', 'Position', [150 100 650 600]);
plot(a, b, '.', 'MarkerSize', 5);
hold on;
pad = 0.05 * (max(y) - min(y));
lim = [min(y) - pad, max(y) + pad];
plot(lim, lim, 'r-', 'LineWidth', 1.5);
hold off;
axis([lim lim]); axis square; grid on;
xlabel(sprintf('%s(t) (%s)', yName, unit));
ylabel(sprintf('%s(t+1) (%s)', yName, unit));
title(sprintf('%s(t) contra %s(t+1): r = %.3f   (vermelho: persistencia)', yName, yName, c(1, 2)), ...
      'Interpreter', 'none');
end


% =====================================================================
%  4. FEATURES, DIVISAO E NORMALIZACAO
% =====================================================================

function [X, y, tDate, names] = create_lag_windows(T, date, p, calendar, first, yName)
% Janelas para a previsao um instante a frente.
% Amostra i (t = i-1 e o ultimo instante conhecido, alvo = t+1 = i):
%   X = [y(t), y(t-1), ..., y(t-p+1), sin(2*pi*doy(t)/365.25), cos(...)]
%   y = y(t+1)          (doy = dia do ano do instante t)
% So usa informacao ate ao instante t (sem fuga de informacao do futuro).
% first : indice do primeiro alvo (default p+1). Usar o mesmo first para
%         todos os p garante que os alvos sao os mesmos ao comparar janelas.
% yName : nome da variavel, usado nos nomes das colunas (default 'y').
if nargin < 4, calendar = true; end
if nargin < 5 || isempty(first), first = p + 1; end
if nargin < 6, yName = 'y'; end
T = T(:);
n = numel(T);
idx = (first:n)';                       % indices dos alvos
m = numel(idx);
X = zeros(m, p);
for k = 1:p
    X(:, k) = T(idx - k);               % y(t-k+1), k = 1 -> y(t)
end
names = cell(1, p);
for k = 1:p
    if k == 1, names{k} = [yName '(t)']; else names{k} = sprintf('%s(t-%d)', yName, k - 1); end
end
if calendar
    dv = datevec(date(idx - 1));
    doy = floor(date(idx - 1) - datenum(dv(:, 1), 1, 1)) + 1;
    X = [X, sin(2 * pi * doy / 365.25), cos(2 * pi * doy / 365.25)];
    names = [names, {'sin_doy', 'cos_doy'}];
end
y = T(idx);
tDate = date(idx);
end

function I = split_random(n, fracs, seed)
% Divisao aleatoria em treino / validacao / teste (fracs = [0.70 0.15 0.15]).
% I.tr, I.va, I.te : indices (ordenados) de cada bloco.
if nargin < 2, fracs = [0.70 0.15 0.15]; end
if nargin < 3, seed = 42; end
rand('state', seed);
perm = randperm(n);
nTr = round(fracs(1) * n);
nVa = round(fracs(2) * n);
I.tr = sort(perm(1:nTr))';
I.va = sort(perm(nTr+1:nTr+nVa))';
I.te = sort(perm(nTr+nVa+1:end))';
end

function I = split_random_by_group(g, fracs, seed)
% Divisao aleatoria por grupos: todas as linhas do mesmo grupo (ex.: a mesma
% mistura com idades diferentes) ficam no mesmo bloco. Serve para discutir se a
% divisao aleatoria simples deixa passar informacao do treino para o teste.
if nargin < 2, fracs = [0.70 0.15 0.15]; end
if nargin < 3, seed = 42; end
g = g(:);
groups = unique(g);
rand('state', seed);
groups = groups(randperm(numel(groups)));
cnt = zeros(numel(groups), 1);
for k = 1:numel(groups), cnt(k) = sum(g == groups(k)); end
cs = cumsum(cnt) / numel(g);
gTr = groups(cs <= fracs(1) + 1e-12);
gVa = groups(cs > fracs(1) + 1e-12 & cs <= fracs(1) + fracs(2) + 1e-12);
gTe = groups(cs > fracs(1) + fracs(2) + 1e-12);
I.tr = find(ismember(g, gTr));
I.va = find(ismember(g, gVa));
I.te = find(ismember(g, gTe));
end

function I = split_chronological(n, fracs)
% Divisao cronologica: primeiros 70% treino, 15% seguintes validacao, ultimos
% 15% teste. Nunca ha amostras do futuro no treino.
if nargin < 2, fracs = [0.70 0.15 0.15]; end
nTr = round(fracs(1) * n);
nVa = round(fracs(2) * n);
I.tr = (1:nTr)';
I.va = (nTr+1:nTr+nVa)';
I.te = (nTr+nVa+1:n)';
end

function S = fit_zscore(X)
% StandardScaler: media e desvio de cada coluna, calculados SO no treino.
S.mu = mean(X, 1);
S.sd = std(X, 1, 1);
S.sd(S.sd == 0) = 1;
end

function Z = apply_zscore(X, S)
Z = (X - repmat(S.mu, size(X, 1), 1)) ./ repmat(S.sd, size(X, 1), 1);
end

function X = invert_zscore(Z, S)
X = Z .* repmat(S.sd, size(Z, 1), 1) + repmat(S.mu, size(Z, 1), 1);
end

function P = split_and_normalize(X, y, I, names, dates)
% Separa os blocos e normaliza inputs E alvo com o scaler do treino.
%   P.Xtr, P.ytr, P.Xva, P.yva, P.Xte, P.yte : normalizados (para a rede)
%   P.ytrRaw, P.yvaRaw, P.yteRaw            : alvo nas unidades originais
%   P.Sx, P.Sy : scalers (P.Sy serve para voltar as unidades originais)
%   P.date     : datas dos alvos (so numa serie temporal, se dates for dado)
if nargin >= 5, P.date = dates; end
P.Sx = fit_zscore(X(I.tr, :));
P.Sy = fit_zscore(y(I.tr));
P.Xtr = apply_zscore(X(I.tr, :), P.Sx);   P.ytr = apply_zscore(y(I.tr), P.Sy);
P.Xva = apply_zscore(X(I.va, :), P.Sx);   P.yva = apply_zscore(y(I.va), P.Sy);
P.Xte = apply_zscore(X(I.te, :), P.Sx);   P.yte = apply_zscore(y(I.te), P.Sy);
P.XtrRaw = X(I.tr, :);  P.XvaRaw = X(I.va, :);  P.XteRaw = X(I.te, :);
P.ytrRaw = y(I.tr);     P.yvaRaw = y(I.va);     P.yteRaw = y(I.te);
P.I = I;
P.d = size(X, 2);
if nargin >= 4, P.names = names; end
end

function plot_chronological_split(tDate, y, I, unit, yName, dsName)
% Alvos de uma serie temporal pintados por bloco (treino / validacao / teste).
if nargin < 4, unit = ''; end
if nargin < 5, yName = 'y'; end
if nargin < 6, dsName = ''; end
figure('Name', 'Divisao cronologica', 'Color', 'w', 'Position', [40 100 1250 420]);
plot(tDate(I.tr), y(I.tr), '-', 'Color', [0.2 0.4 0.8]);
hold on;
plot(tDate(I.va), y(I.va), '-', 'Color', [0.95 0.6 0.1]);
plot(tDate(I.te), y(I.te), '-', 'Color', [0.8 0.15 0.15]);
hold off;
datetick('x', 'yyyy');
xlim([tDate(1) tDate(end)]);
grid on;
ylabel(sprintf('%s(t+1) (%s)', yName, unit));
legend(sprintf('treino (%d)', numel(I.tr)), sprintf('validacao (%d)', numel(I.va)), ...
       sprintf('teste (%d)', numel(I.te)), 'Location', 'NorthEast');
title(sprintf('%s - divisao cronologica dos alvos (treino / validacao / teste)', dsName));
end


function plot_window_size_selection(pList, rmseP, rmsePers, pSel, unit, col)
% RMSE de validacao do AR linear contra o tamanho da janela p, sem e com
% sin/cos do dia do ano; linha da persistencia; estrela no p escolhido
% (col = coluna de rmseP usada na escolha: 1 sem, 2 com calendario).
if nargin < 5, unit = ''; end
if nargin < 6, col = 2; end
figure('Name', 'Escolha de p', 'Color', 'w', 'Position', [150 150 800 450]);
plot(pList, rmseP(:, 1), 'b-o', pList, rmseP(:, 2), 'r-s', 'MarkerSize', 4, 'LineWidth', 1.2);
hold on;
plot([pList(1) pList(end)], [rmsePers rmsePers], 'k--');
plot(pSel, rmseP(pList == pSel, col), 'kp', 'MarkerSize', 14, 'MarkerFaceColor', 'y');
hold off;
grid on;
xlabel('p (instantes na janela)');
ylabel(sprintf('RMSE na validacao (%s)', unit));
legend('AR linear', 'AR linear + sin/cos dia do ano', 'persistencia', 'p escolhido');
title('Escolha da janela p (modelo AR linear, conjunto de validacao)');
end


% =====================================================================
%  5. MODELOS LINEARES DE REFERENCIA E METRICAS
% =====================================================================

function w = fit_linear_regression(X, y)
% Regressao linear por minimos quadrados (com termo constante).
w = [ones(size(X, 1), 1) X] \ y;
end

function yhat = predict_linear_regression(w, X)
yhat = [ones(size(X, 1), 1) X] * w;
end

function m = compute_regression_metrics(y, yhat)
% MSE, RMSE, MAE e R2 (nas unidades em que y e yhat forem dados).
e = y(:) - yhat(:);
m.mse  = mean(e .^ 2);
m.rmse = sqrt(m.mse);
m.mae  = mean(abs(e));
m.r2   = 1 - sum(e .^ 2) / sum((y(:) - mean(y(:))) .^ 2);
end


% =====================================================================
%  6. REDE NEURONAL (feed-forward, tanh nas camadas escondidas, saida linear)
% =====================================================================
% Os parametros vivem num unico vetor coluna theta, camada a camada:
%   theta = [W1(:); b1(:); W2(:); b2(:); ...],  Wk e (n_{k-1} x n_k), bk e (1 x n_k)
% layers = [d, h1, h2, ..., 1]   (ex.: [9 10 1])

function archs = get_architecture_ids()
% Identificadores das arquiteturas estudadas (ver get_architecture_layers).
archs = {'A', 'B', 'C'};
end

function [algs, names, labels] = get_algorithm_list()
% Algoritmos de treino estudados: codigo, nome completo e nome curto.
algs   = {'gd', 'adam', 'bfgs'};
names  = {'Mini-batch GD', 'Adam', 'BFGS'};
labels = {'GD', 'Adam', 'BFGS'};
end

function [layers, name] = get_architecture_layers(id, d, N)
% Arquiteturas do enunciado (N = 10):
%   'A' Referencia : 1 camada escondida com N neuronios
%   'B' Larga      : 1 camada escondida com 10N neuronios
%   'C' Profunda   : 10 camadas escondidas com N neuronios
if nargin < 3, N = 10; end
switch upper(id)
    case 'A', layers = [d N 1];             name = 'A - Referencia';
    case 'B', layers = [d 10*N 1];          name = 'B - Larga';
    case 'C', layers = [d N*ones(1, 10) 1]; name = 'C - Profunda';
    otherwise, error('get_architecture_layers: arquitetura desconhecida %s', id);
end
end

function names = get_architecture_names(d, N)
% Nomes das arquiteturas ('A - Referencia', ...) para d inputs.
archs = get_architecture_ids();
names = cell(1, numel(archs));
for a = 1:numel(archs), [lay, names{a}] = get_architecture_layers(archs{a}, d, N); end
end

function p = count_params(layers)
p = sum(layers(1:end-1) .* layers(2:end) + layers(2:end));
end

function [iW, ib] = get_parameter_indices(layers)
% Indices de Wk e bk dentro de theta.
nL = numel(layers) - 1;
iW = cell(nL, 1);  ib = cell(nL, 1);
pos = 0;
for k = 1:nL
    nW = layers(k) * layers(k+1);
    iW{k} = pos + (1:nW);            pos = pos + nW;
    ib{k} = pos + (1:layers(k+1));   pos = pos + layers(k+1);
end
end

function theta = init_params(layers, seed)
% Inicializacao de Glorot/Xavier (normal): W ~ N(0, 2/(n_in + n_out)), b = 0.
% A mesma seed da sempre os mesmos pesos (usado para comparar os algoritmos
% a partir do mesmo ponto inicial).
randn('state', seed);
[iW, ib] = get_parameter_indices(layers);
theta = zeros(count_params(layers), 1);
for k = 1:numel(layers) - 1
    theta(iW{k}) = randn(numel(iW{k}), 1) * sqrt(2 / (layers(k) + layers(k+1)));
end
end

function yhat = predict_network(theta, layers, X)
% Saida da rede para as linhas de X.
[iW, ib] = get_parameter_indices(layers);
n = size(X, 1);
nL = numel(layers) - 1;
A = X;
for k = 1:nL
    W = reshape(theta(iW{k}), layers(k), layers(k+1));
    Z = A * W + repmat(theta(ib{k})', n, 1);
    if k < nL, A = tanh(Z); else A = Z; end
end
yhat = A;
end

function [J, g] = loss_grad(theta, layers, X, y)
% Perda J = MSE = mean((yhat - y).^2) e o seu gradiente (backpropagation)
% em relacao a todos os pesos e bias, na mesma ordem de theta.
[iW, ib] = get_parameter_indices(layers);
n = size(X, 1);
nL = numel(layers) - 1;
A = cell(nL + 1, 1);
W = cell(nL, 1);
A{1} = X;
for k = 1:nL
    W{k} = reshape(theta(iW{k}), layers(k), layers(k+1));
    Z = A{k} * W{k} + repmat(theta(ib{k})', n, 1);
    if k < nL, A{k+1} = tanh(Z); else A{k+1} = Z; end
end
e = A{nL+1} - y;
J = mean(e .^ 2);
if nargout > 1
    g = zeros(size(theta));
    dZ = 2 * e / n;                                % dJ/dZ na saida (linear)
    for k = nL:-1:1
        dW = A{k}' * dZ;
        g(iW{k}) = dW(:);
        g(ib{k}) = sum(dZ, 1)';
        if k > 1
            dZ = (dZ * W{k}') .* (1 - A{k} .^ 2);  % tanh'(z) = 1 - tanh(z)^2
            % numeros desnormalizados (< 1e-300) tornam as contas centenas de
            % vezes mais lentas no MATLAB de 32 bits; sao zero na pratica
            dZ(abs(dZ) < 1e-300) = 0;
        end
    end
end
end

function [maxRel, normRel, maxAbs] = check_gradient(theta, layers, X, y, h)
% Compara o gradiente analitico com diferencas finitas centrais:
%   gNum_i = (J(theta + h e_i) - J(theta - h e_i)) / (2h)
% maxRel  = max_i |g_i - gNum_i| / max(|g_i|, |gNum_i|)  (so onde o gradiente
%           nao e praticamente zero, > 1e-7)
% normRel = ||g - gNum|| / (||g|| + ||gNum||)
if nargin < 5, h = 1e-6; end
[J, g] = loss_grad(theta, layers, X, y);
gNum = zeros(size(theta));
for i = 1:numel(theta)
    tp = theta;  tp(i) = tp(i) + h;
    tm = theta;  tm(i) = tm(i) - h;
    gNum(i) = (loss_grad(tp, layers, X, y) - loss_grad(tm, layers, X, y)) / (2 * h);
end
den = max(abs(g), abs(gNum));
ok = den > 1e-7;
maxRel = max(abs(g(ok) - gNum(ok)) ./ den(ok));
normRel = norm(g - gNum) / (norm(g) + norm(gNum));
maxAbs = max(abs(g - gNum));                 % medida usada no nnlib2 das aulas
end


% =====================================================================
%  7. ALGORITMOS DE TREINO
% =====================================================================
% Regras comuns (enunciado, secao 4):
%  - todos comecam no theta0 dado (o mesmo para os 3 algoritmos em cada run);
%  - mesmo orcamento em epoch-equivalentes (opts.budget): 1 epoch-equivalente =
%    uma passagem pelo treino (GD/Adam) ou uma avaliacao de perda+gradiente no
%    treino completo (BFGS, incluindo as da line search);
%  - devolvem os parametros com a menor perda de validacao vista no treino.
% hist (todas as series tem budget+1 valores, indice 1 = epoch-equivalente 0):
%   hist.train, hist.val : MSE (unidades normalizadas)
%   hist.time            : segundos acumulados
%   hist.bestVal, hist.bestEpoch, hist.nGrad (avaliacoes de gradiente no treino
%   completo), hist.elapsed, hist.stop (motivo de paragem), hist.failed
% A avaliacao da perda de validacao serve so para monitorizar e escolher o
% melhor modelo, por isso nao conta para o orcamento.

function opts = fill_default_options(opts)
% Completa opts com os valores por omissao.
if nargin < 1, opts = struct(); end
def = {'budget', 1000; 'lr', 0.01; 'batch', 32; 'seed', 42; ...
       'beta1', 0.9; 'beta2', 0.999; 'eps', 1e-8; ...
       'c1', 1e-4; 'maxLS', 20; 'gradTol', 1e-6; 'maxIter', Inf; 'verbose', false};
for k = 1:size(def, 1)
    if ~isfield(opts, def{k, 1}), opts.(def{k, 1}) = def{k, 2}; end
end
end

function hist = create_history(budget, jTrain0, jVal0)
% Historico de um treino com budget+1 pontos, ja com o ponto inicial
% (perdas de treino e de validacao dos pesos iniciais, epoch-equivalente 0).
hist.train = nan(budget + 1, 1);
hist.val   = nan(budget + 1, 1);
hist.time  = nan(budget + 1, 1);
hist.train(1) = jTrain0;
hist.val(1)   = jVal0;
hist.time(1)  = 0;
hist.bestVal = jVal0;
hist.bestEpoch = 0;
hist.nGrad = 0;
hist.failed = false;
hist.stop = 'budget';
end

function [theta, hist] = train_minibatch_gd_or_adam(theta0, layers, Xtr, ytr, Xva, yva, opts, useAdam)
% Nucleo comum de mini-batch GD e Adam (mini-batches de opts.batch amostras,
% baralhados em cada epoch com a seed opts.seed).
opts = fill_default_options(opts);
rand('state', opts.seed);
n = size(Xtr, 1);
B = opts.batch;
theta = theta0;
best = theta0;
hist = create_history(opts.budget, loss_grad(theta, layers, Xtr, ytr), loss_grad(theta, layers, Xva, yva));
m = zeros(size(theta));  v = zeros(size(theta));  t = 0;
t0 = clock;
for ep = 1:opts.budget
    perm = randperm(n);
    for s = 1:B:n
        idx = perm(s:min(s + B - 1, n));
        [J, g] = loss_grad(theta, layers, Xtr(idx, :), ytr(idx));
        if useAdam
            t = t + 1;
            m = opts.beta1 * m + (1 - opts.beta1) * g;
            v = opts.beta2 * v + (1 - opts.beta2) * (g .* g);
            v(v < 1e-300) = 0;  m(abs(m) < 1e-300) = 0;   % evita desnormalizados
            mh = m / (1 - opts.beta1 ^ t);
            vh = v / (1 - opts.beta2 ^ t);
            theta = theta - opts.lr * mh ./ (sqrt(vh) + opts.eps);
        else
            theta = theta - opts.lr * g;
        end
    end
    hist.nGrad = hist.nGrad + 1;                   % n amostras = 1 gradiente completo
    jt = loss_grad(theta, layers, Xtr, ytr);
    jv = loss_grad(theta, layers, Xva, yva);
    hist.train(ep + 1) = jt;
    hist.val(ep + 1)   = jv;
    hist.time(ep + 1)  = etime(clock, t0);
    if ~isfinite(jt) || jt > 1e6
        hist.failed = true;  hist.stop = 'divergiu';
        break;
    end
    if jv < hist.bestVal
        hist.bestVal = jv;  hist.bestEpoch = ep;  best = theta;
    end
end
theta = best;
hist.elapsed = etime(clock, t0);
end

function [theta, hist] = train_gd(theta0, layers, Xtr, ytr, Xva, yva, opts)
% Mini-batch gradient descent: theta <- theta - lr * g(mini-batch).
[theta, hist] = train_minibatch_gd_or_adam(theta0, layers, Xtr, ytr, Xva, yva, opts, false);
end

function [theta, hist] = train_adam(theta0, layers, Xtr, ytr, Xva, yva, opts)
% Adam: medias moveis do gradiente (m) e do seu quadrado (v), com correcao
% de enviesamento; beta1 = 0.9, beta2 = 0.999, eps = 1e-8.
[theta, hist] = train_minibatch_gd_or_adam(theta0, layers, Xtr, ytr, Xva, yva, opts, true);
end

function [theta, hist] = train_with_algorithm(alg, theta0, layers, P, opts)
% Treina com o algoritmo indicado ('gd', 'adam' ou 'bfgs') nos dados P
% (P.Xtr, P.ytr para treinar; P.Xva, P.yva para escolher o melhor modelo).
switch alg
    case 'gd',   [theta, hist] = train_gd(theta0, layers, P.Xtr, P.ytr, P.Xva, P.yva, opts);
    case 'adam', [theta, hist] = train_adam(theta0, layers, P.Xtr, P.ytr, P.Xva, P.yva, opts);
    case 'bfgs', [theta, hist] = train_bfgs(theta0, layers, P.Xtr, P.ytr, P.Xva, P.yva, opts);
    otherwise,   error('Algoritmo desconhecido: %s', alg);
end
end

function [theta, hist] = train_bfgs(theta0, layers, Xtr, ytr, Xva, yva, opts)
% BFGS (quasi-Newton, treino completo). H aproxima a inversa da Hessiana.
%  - direcao d = -H*g (se nao for de descida, H volta a identidade)
%  - line search de backtracking com a condicao de Armijo:
%      J(theta + a*d) <= J(theta) + c1 * a * g'*d,  a = 1, 1/2, 1/4, ...
%    (c1 = opts.c1, no maximo opts.maxLS tentativas)
%  - atualizacao BFGS de H (so se s'*y > 0, para H continuar definida positiva),
%    escrita em O(p^2):  H <- H + (s'y + y'Hy)/(s'y)^2 * s*s' - (Hy*s' + s*(Hy)')/(s'y)
%  - na 1a iteracao H e escalada por s'y / y'y antes da atualizacao
%  - para quando: orcamento esgotado, ||g|| < opts.gradTol, opts.maxIter
%    iteracoes feitas (por omissao Inf: manda o orcamento), ou line search falha
% Cada avaliacao de perda+gradiente no treino completo custa 1 epoch-equivalente.
% hist.nIter = numero de iteracoes BFGS (passos aceites).
opts = fill_default_options(opts);
theta = theta0;
best = theta0;
p = numel(theta);
H = eye(p);
t0 = clock;
[J, g] = loss_grad(theta, layers, Xtr, ytr);
hist = create_history(opts.budget, J, loss_grad(theta, layers, Xva, yva));
cost = 1;                                         % avaliacoes ja gastas
hist.nGrad = 1;
last = 1;                                        % ultimo indice preenchido
firstIt = true;
hist.nIter = 0;
while cost < opts.budget
    if norm(g) < opts.gradTol
        hist.stop = 'gradTol';  break;
    end
    if hist.nIter >= opts.maxIter
        hist.stop = 'maxIter';  break;
    end
    d = -H * g;
    gd = g' * d;
    if gd >= 0
        H = eye(p);  d = -g;  gd = g' * d;
    end
    a = 1;  ok = false;
    for ls = 1:opts.maxLS
        thetaNew = theta + a * d;
        [Jn, gn] = loss_grad(thetaNew, layers, Xtr, ytr);
        cost = cost + 1;
        hist.nGrad = hist.nGrad + 1;
        if isfinite(Jn) && Jn <= J + opts.c1 * a * gd
            ok = true;  break;
        end
        if cost >= opts.budget, break; end
        a = a / 2;
    end
    if ~ok
        if cost >= opts.budget, hist.stop = 'budget'; else hist.stop = 'linesearch'; end
        break;
    end
    s = thetaNew - theta;
    yk = gn - g;
    sy = s' * yk;
    if sy > 1e-10
        if firstIt
            H = (sy / (yk' * yk)) * eye(p);
            firstIt = false;
        end
        Hy = H * yk;
        H = H + ((sy + yk' * Hy) / sy ^ 2) * (s * s') - (Hy * s' + s * Hy') / sy;
    end
    theta = thetaNew;  J = Jn;  g = gn;
    hist.nIter = hist.nIter + 1;
    jv = loss_grad(theta, layers, Xva, yva);
    % os epoch-equivalentes gastos nesta iteracao (incl. line search) ficam com
    % o valor anterior; o novo ponto so existe no fim da iteracao
    c = min(cost, opts.budget) + 1;
    hist.train(last+1:c-1) = hist.train(last);
    hist.val(last+1:c-1)   = hist.val(last);
    hist.time(last+1:c-1)  = hist.time(last);
    hist.train(c) = J;  hist.val(c) = jv;  hist.time(c) = etime(clock, t0);
    last = c;
    if jv < hist.bestVal
        hist.bestVal = jv;  hist.bestEpoch = c - 1;  best = theta;
    end
end
% se parou antes do fim do orcamento, a curva fica constante ate ao fim
hist.train(last+1:end) = hist.train(last);
hist.val(last+1:end)   = hist.val(last);
hist.time(last+1:end)  = hist.time(last);
hist.stopEpoch = last - 1;
theta = best;
hist.elapsed = etime(clock, t0);
end


% =====================================================================
%  8. AFINACAO DO LEARNING RATE (so com o conjunto de validacao)
% =====================================================================

function R = tune_learning_rate(alg, layers, P, lrs, seeds, opts, logFile)
% Treina com cada learning rate de lrs e cada seed de seeds (pesos iniciais e
% ordem dos mini-batches) e guarda a melhor perda de validacao de cada run.
%   alg : 'gd' ou 'adam'
% Criterio: learning rate com a menor MEDIANA da melhor perda de validacao
% (robusta a uma run falhada). R.edge = true se o escolhido esta no limite da grelha.
if nargin < 7, logFile = ''; end
nL = numel(lrs);  nS = numel(seeds);
R.alg = alg;  R.lrs = lrs(:)';  R.seeds = seeds(:)';
R.bestVal = nan(nL, nS);  R.bestEpoch = nan(nL, nS);
R.failed = false(nL, nS);  R.time = nan(nL, nS);
R.curves = cell(nL, 1);                           % curva de validacao mediana por lr
for i = 1:nL
    V = nan(opts.budget + 1, nS);
    for r = 1:nS
        o = opts;  o.lr = lrs(i);  o.seed = seeds(r);
        [th, h] = train_with_algorithm(alg, init_params(layers, seeds(r)), layers, P, o);
        R.bestVal(i, r) = h.bestVal;
        R.bestEpoch(i, r) = h.bestEpoch;
        R.failed(i, r) = h.failed;
        R.time(i, r) = h.elapsed;
        V(:, r) = h.val;
    end
    R.curves{i} = quantile_per_row(V, 0.5);
    print_and_log(logFile, sprintf('    %-4s lr = %.2e : mediana val %.4f | falhadas %d | %.1f s', ...
            alg, lrs(i), median(R.bestVal(i, :)), sum(R.failed(i, :)), sum(R.time(i, :))));
end
R = choose_best_learning_rate(R);
end

function R = choose_best_learning_rate(R)
% Resume as repeticoes de cada learning rate (mediana, media, desvio da melhor
% perda de validacao) e escolhe o de menor mediana. R.edge = true se o
% escolhido esta no limite da grelha.
R.median = median(R.bestVal, 2);
R.mean = mean(R.bestVal, 2);
R.std = std(R.bestVal, 0, 2);
[mn, k] = min(R.median);
R.best = k;
R.lrBest = R.lrs(k);
R.edge = (k == 1 || k == numel(R.lrs));
end

function R = merge_tuning_results(R, R2)
% Junta os resultados de R2 (novos learning rates) a R, ordena por lr e volta
% a escolher o melhor. Usado para alargar a grelha quando o escolhido fica no limite.
R.lrs = [R.lrs R2.lrs];
R.bestVal = [R.bestVal; R2.bestVal];      R.bestEpoch = [R.bestEpoch; R2.bestEpoch];
R.failed = [R.failed; R2.failed];         R.time = [R.time; R2.time];
R.curves = [R.curves; R2.curves];
[R.lrs, o] = sort(R.lrs);
R.bestVal = R.bestVal(o, :);  R.bestEpoch = R.bestEpoch(o, :);
R.failed = R.failed(o, :);    R.time = R.time(o, :);  R.curves = R.curves(o);
R = choose_best_learning_rate(R);
end

function plot_learning_rate_tuning(Rgd, Rad, archNames, titleStr)
% Para cada arquitetura: melhor perda de validacao contra o learning rate
% (mediana e minimo-maximo das repeticoes) para GD e Adam. Estrela = escolhido.
figure('Name', titleStr, 'Color', 'w', 'Position', [40 100 1300 430]);
for a = 1:numel(Rgd)
    subplot(1, numel(Rgd), a);
    RR = {Rgd{a}, Rad{a}};  cols = [0.1 0.3 0.8; 0.85 0.2 0.1];
    h = zeros(1, 2);
    for k = 1:2
        x = RR{k}.lrs;  md = RR{k}.median';
        lo = min(RR{k}.bestVal, [], 2)';  hi = max(RR{k}.bestVal, [], 2)';
        h(k) = loglog(x, md, '-o', 'Color', cols(k, :), 'LineWidth', 1.5, ...
                      'MarkerFaceColor', cols(k, :));
        hold on;
        for i = 1:numel(x)
            loglog([x(i) x(i)], [lo(i) hi(i)], '-', 'Color', cols(k, :));
        end
        loglog(RR{k}.lrBest, md(RR{k}.best), 'p', 'MarkerSize', 15, ...
               'MarkerFaceColor', 'y', 'MarkerEdgeColor', 'k');
    end
    hold off;
    grid on;
    xlabel('learning rate');
    ylabel('melhor MSE de validacao');
    title(archNames{a});
    legend(h, 'Mini-batch GD', 'Adam', 'Location', 'Best');
end
add_figure_title([titleStr '  (mediana; barra = min-max das repeticoes; estrela = escolhido)']);
end

function print_to_screen_and_file(txt, fid)
% Escreve txt no ecra e, se fid for um ficheiro aberto, tambem no ficheiro.
fprintf('%s', txt);
if ~isempty(fid), fprintf(fid, '%s', txt); end
end

function print_and_log(logFile, msg)
% Escreve no ecra e (se dado) acrescenta a um ficheiro de progresso.
fprintf('%s\n', msg);
if ~isempty(logFile)
    fid = fopen(logFile, 'a');
    fprintf(fid, '%s  %s\n', datestr(now, 'HH:MM:SS'), msg);
    fclose(fid);
end
end


% =====================================================================
%  9. EXPERIENCIAS FINAIS (30 runs por combinacao)
% =====================================================================

function S = train_algorithm_runs(alg, layers, P, lr, budget, seeds, S, saveFn, logFile, unit)
% Treina UM algoritmo (alg = 'gd', 'adam' ou 'bfgs') numa arquitetura, uma vez
% por seed. Run k: pesos iniciais init_params(layers, seeds(k)) e ordem dos
% mini-batches com a mesma seed -> os 3 algoritmos partem dos MESMOS pesos em
% cada run (comparacao emparelhada), qualquer que seja a ordem em que correm.
%   S : resultados parciais (para continuar) ou [].  saveFn(S) grava depois de
%       cada run (se o script for interrompido, continua onde parou).
% Campos de S (nRuns = numel(seeds)):
%   train, val, time   : (budget+1) x nRuns  (MSE normalizado / segundos)
%   rmse, mse, mae, r2 : 1 x nRuns  (teste, unidades originais)
%   nGrad, elapsed, bestEpoch, bestVal, failed : 1 x nRuns
%   yhat : nTeste x nRuns (previsoes no teste, unidades originais)
%   done : numero de runs ja feitas
nR = numel(seeds);
if isempty(S)
    S.train = nan(budget + 1, nR);  S.val = nan(budget + 1, nR);  S.time = nan(budget + 1, nR);
    S.rmse = nan(1, nR);  S.mse = nan(1, nR);  S.mae = nan(1, nR);  S.r2 = nan(1, nR);
    S.nGrad = nan(1, nR);  S.elapsed = nan(1, nR);  S.bestEpoch = nan(1, nR);
    S.bestVal = nan(1, nR);  S.failed = false(1, nR);
    S.yhat = nan(numel(P.yteRaw), nR);
    S.done = 0;
end
for r = S.done + 1:nR
    th0 = init_params(layers, seeds(r));
    o = fill_default_options(struct('budget', budget, 'seed', seeds(r), 'lr', lr));
    [th, h] = train_with_algorithm(alg, th0, layers, P, o);
    yh = invert_zscore(predict_network(th, layers, P.Xte), P.Sy);
    m = compute_regression_metrics(P.yteRaw, yh);
    S.train(:, r) = h.train;  S.val(:, r) = h.val;  S.time(:, r) = h.time;
    S.rmse(r) = m.rmse;  S.mse(r) = m.mse;  S.mae(r) = m.mae;  S.r2(r) = m.r2;
    S.nGrad(r) = h.nGrad;  S.elapsed(r) = h.elapsed;  S.bestEpoch(r) = h.bestEpoch;
    S.bestVal(r) = h.bestVal;  S.failed(r) = h.failed;  S.yhat(:, r) = yh;
    S.done = r;
    saveFn(S);
    msg = sprintf('    run %2d/%d: RMSE teste %.3f %s | R2 %.3f | melhor epoch %4d | %6.1f s', ...
                  r, nR, m.rmse, unit, m.r2, h.bestEpoch, h.elapsed);
    if h.failed, msg = [msg '  [divergiu]']; end
    print_and_log(logFile, msg);
end
end


function save_result_to_mat(file, varName, key, E)
% Guarda E em varName.(key) dentro do ficheiro .mat, sem apagar o resto
% (ex.: TUNE.Concrete_A_gd ou FINAL.Melbourne_C).
if exist(file, 'file'), S = load(file); else S = struct(); end
if ~isfield(S, varName), S.(varName) = struct(); end
S.(varName).(key) = E;
save(file, '-struct', 'S');
end

function S = load_results_from_mat(file, varName)
% Le varName do ficheiro .mat (estrutura vazia se nao existir).
S = struct();
if exist(file, 'file')
    F = load(file);
    if isfield(F, varName), S = F.(varName); end
end
end


% =====================================================================
%  10. RESULTADOS (figuras e tabelas do passo 8)
% =====================================================================

function plot_training_curves(E, titleStr, useTime)
% Treino (esq.) e validacao (dir.): mediana e intervalo interquartil (Q1-Q3)
% das 30 runs, eixo vertical logaritmico, eixo horizontal em epoch-equivalentes
% (useTime = true: em segundos, mediana do tempo acumulado).
if nargin < 3, useTime = false; end
[algs, lbl] = get_algorithm_list();
cols = [0.1 0.3 0.8; 0.85 0.2 0.1; 0.1 0.6 0.2];
fields = {'train', 'val'};  ttl = {'Treino', 'Validacao'};
figure('Name', titleStr, 'Color', 'w', 'Position', [40 80 1300 480]);
for f = 1:2
    subplot(1, 2, f);
    h = zeros(1, 3);
    for g = 1:3
        Y = E.(algs{g}).(fields{f});
        q1 = quantile_per_row(Y, 0.25);  md = quantile_per_row(Y, 0.5);  q3 = quantile_per_row(Y, 0.75);
        if useTime
            x = quantile_per_row(E.(algs{g}).time, 0.5);
        else
            x = (0:size(Y, 1) - 1)';
        end
        ok = ~isnan(md) & ~isnan(x) & q1 > 0;
        x = x(ok);  q1 = q1(ok);  md = md(ok);  q3 = q3(ok);
        fill([x; flipud(x)], [q1; flipud(q3)], cols(g, :) * 0.35 + 0.65, 'EdgeColor', 'none');
        hold on;
        h(g) = plot(x, md, '-', 'Color', cols(g, :), 'LineWidth', 1.8);
    end
    hold off;
    set(gca, 'YScale', 'log');
    grid on;
    if useTime, xlabel('tempo (s, mediana das runs)'); else xlabel('epoch-equivalentes'); end
    ylabel('MSE (unidades normalizadas)');
    title(sprintf('%s - mediana e Q1-Q3 (%d runs)', ttl{f}, size(E.gd.train, 2)));
    legend(h, lbl, 'Location', 'NorthEast');
end
add_figure_title(titleStr);
end

function q = quantile_per_row(Y, p)
% Quantil p de cada linha de Y (ignora NaN).
q = nan(size(Y, 1), 1);
for i = 1:size(Y, 1)
    v = Y(i, ~isnan(Y(i, :)));
    if ~isempty(v), q(i) = quantile_linear(v, p); end
end
end

function T = print_summary_table(Es, archNames, unit, fid)
% Tabela 3x3 (arquitetura x algoritmo): RMSE e R2 de teste em media +/- desvio,
% mediana, melhor e pior RMSE e tempo medio. Escreve no ecra e em fid (se dado).
% Es{a} = resultados da arquitetura a.
if nargin < 4, fid = []; end
[algs, names, lbl] = get_algorithm_list();
T = zeros(numel(Es), 3, 8);
hdr = sprintf('%-15s %-5s %17s %15s %8s %8s %8s %9s %8s\n', 'Arquitetura', 'Alg.', ...
              ['RMSE (' unit ')'], 'R2', 'mediana', 'melhor', 'pior', 'tempo(s)', 'falhas');
out = hdr;
for a = 1:numel(Es)
    for g = 1:3
        S = Es{a}.(algs{g});
        T(a, g, :) = [mean(S.rmse), std(S.rmse), mean(S.r2), std(S.r2), median(S.rmse), ...
                      min(S.rmse), max(S.rmse), mean(S.elapsed)];
        out = [out sprintf('%-15s %-5s %8.3f +/- %5.3f %6.3f +/- %5.3f %8.3f %8.3f %8.3f %9.2f %8d\n', ...
               archNames{a}, lbl{g}, T(a, g, 1:8), sum(S.failed))];
    end
end
print_to_screen_and_file(out, fid);
end

function plot_test_rmse_boxplots(Es, archShort, refs, refNames, unit, titleStr)
% Boxplots (sem toolbox) do RMSE de teste das 9 combinacoes; linhas horizontais
% = modelos de referencia.
[algs, names, lbl] = get_algorithm_list();
cols = [0.1 0.3 0.8; 0.85 0.2 0.1; 0.1 0.6 0.2];
figure('Name', titleStr, 'Color', 'w', 'Position', [80 80 1100 520]);
hold on;
pos = 0;  ticks = [];  tl = {};
for a = 1:numel(Es)
    for g = 1:3
        pos = pos + 1;
        s = compute_boxplot_stats(Es{a}.(algs{g}).rmse);
        draw_boxplot(s, pos, cols(g, :) * 0.5 + 0.5, false, 0.3);
        ticks(end+1) = pos;  tl{end+1} = sprintf('%s-%s', archShort{a}, lbl{g});
    end
    pos = pos + 0.6;
end
hr = draw_reference_lines(refs, [0.4 pos + 0.2]);
hold off;
set(gca, 'XTick', ticks, 'XTickLabel', tl, 'XLim', [0.4 pos + 0.2], 'FontSize', 8);
grid on;
ylabel(['RMSE de teste (' unit ')']);
if ~isempty(refs), legend(hr, refNames, 'Location', 'NorthEast'); end
title(sprintf('%s  (%d runs por caixa)', titleStr, numel(Es{1}.gd.rmse)));
end

function [a, g, r] = select_representative_run(Es)
% Escolhe, SO pela validacao, a combinacao com menor mediana da melhor perda de
% validacao e, dentro dela, a run com a perda de validacao mediana.
algs = get_algorithm_list();
best = Inf;  a = 1;  g = 1;
for i = 1:numel(Es)
    for j = 1:3
        m = median(Es{i}.(algs{j}).bestVal);
        if m < best, best = m; a = i; g = j; end
    end
end
v = Es{a}.(algs{g}).bestVal;
[sv, ord] = sort(v);
r = ord(ceil(numel(v) / 2));
end

function plot_predicted_vs_measured(y, yhat, yName, unit, titleStr)
% Previsto contra medido (com a reta y = x) e histograma dos residuos.
figure('Name', titleStr, 'Color', 'w', 'Position', [100 100 1100 480]);
subplot(1, 2, 1);
plot(y, yhat, 'o', 'MarkerSize', 4, 'MarkerFaceColor', [0.3 0.5 0.8]);
hold on;
lim = [min([y; yhat]), max([y; yhat])];
lim = lim + [-0.05 0.05] * (lim(2) - lim(1));
plot(lim, lim, 'r-', 'LineWidth', 1.5);
hold off;
axis([lim lim]); axis square; grid on;
m = compute_regression_metrics(y, yhat);
xlabel(sprintf('%s medido (%s)', yName, unit));
ylabel(sprintf('%s previsto (%s)', yName, unit));
title(sprintf('Teste: RMSE %.2f %s, R^2 %.3f', m.rmse, unit, m.r2));
subplot(1, 2, 2);
plot_residual_histogram(y - yhat, unit);
add_figure_title(titleStr);
end

function plot_forecast_vs_observed(dates, y, yhat, yPers, zoomN, yName, unit, titleStr)
% Observado e previsto ao longo do teste, ampliacao dos primeiros zoomN
% instantes (com a persistencia) e histograma dos residuos.
figure('Name', titleStr, 'Color', 'w', 'Position', [40 60 1300 750]);
subplot(2, 1, 1);
plot(dates, y, 'k-', dates, yhat, 'r-');
datetick('x', 'mmmyy');  xlim([dates(1) dates(end)]);  grid on;   % formato pre-definido 12
ylabel(sprintf('%s (%s)', yName, unit));
m = compute_regression_metrics(y, yhat);
title(sprintf('Periodo de teste: observado (preto) e previsto (vermelho) - RMSE %.2f %s', m.rmse, unit));
subplot(2, 2, 3);
z = 1:min(zoomN, numel(y));
plot(dates(z), y(z), 'k.-', dates(z), yhat(z), 'r.-', dates(z), yPers(z), 'b:');
datetick('x', 'mm/dd');  xlim([dates(z(1)) dates(z(end))]);  grid on;   % formato pre-definido 6
ylabel(sprintf('%s (%s)', yName, unit));
legend('observado', 'rede', 'persistencia', 'Location', 'Best');
title(sprintf('Ampliacao: primeiros %d instantes do teste', numel(z)));
subplot(2, 2, 4);
plot_residual_histogram(y - yhat, unit);
add_figure_title(titleStr);
end

function plot_residual_histogram(res, unit)
[cnt, ctr] = hist(res, 30);
bar(ctr, cnt, 1, 'FaceColor', [0.5 0.6 0.8], 'EdgeColor', 'w');
hold on;
xg = linspace(min(res), max(res), 200);
sd = std(res);
plot(xg, compute_normal_curve(xg, mean(res), sd, numel(res), ctr(2) - ctr(1)), 'r-', 'LineWidth', 1.5);
hold off;
grid on;
xlabel(['residuo = medido - previsto (' unit ')']);
ylabel('frequencia');
title(sprintf('Residuos: media %.2f, desvio %.2f', mean(res), sd));
end


% =====================================================================
%  11. PIPELINE GENERICO - MODELACAO (redes, afinacao, experiencias, resultados)
% =====================================================================

function check_architectures_and_gradients(D, P, N, seed)
% Numero de parametros das 3 arquiteturas (comparado com as formulas do
% enunciado) e verificacao do gradiente: backprop vs diferencas finitas
% centrais em 40 amostras de treino, pesos iniciais com a seed dada.
archs = get_architecture_ids();
d = P.d;
formula = [(d + 2) * N + 1, (d + 2) * 10 * N + 1, 9 * N^2 + (d + 11) * N + 1];
fprintf('\n%s - arquiteturas (formula do enunciado entre parenteses):\n', D.name);
for a = 1:3
    [lay, nm] = get_architecture_layers(archs{a}, d, N);
    fprintf('  %-15s layers = %-28s p = %5d (%d)\n', nm, mat2str(lay), count_params(lay), formula(a));
end
fprintf('%s - verificacao do gradiente (backprop vs diferencas finitas, h = 1e-6):\n', D.name);
nChk = min(40, size(P.Xtr, 1));
for a = 1:3
    lay = get_architecture_layers(archs{a}, d, N);
    th = init_params(lay, seed);
    [mr, nr, ma] = check_gradient(th, lay, P.Xtr(1:nChk, :), P.ytr(1:nChk));
    fprintf('  arq. %s: erro relativo maximo %.2e | erro relativo da norma %.2e | erro absoluto maximo %.2e\n', ...
            archs{a}, mr, nr, ma);
end
end

function LRd = tune_learning_rates(D, P, lrGrid, seeds, tuneFile, logFile, figDir, N)
% Afinacao do learning rate de GD e Adam nas 3 arquiteturas, so com o
% conjunto de validacao (orcamento = cfg.budget). Se o escolhido ficar no limite
% da grelha, acrescenta-se um valor nesse sentido (fator sqrt(10)), no maximo 2
% vezes. Resultados em tuneFile (TUNE.<nome>_<arq>_<alg>); o que ja la esta nao
% volta a ser corrido.
% LRd(a, g) : learning rate escolhido (a = A,B,C; g = 1 GD, 2 Adam).
archs = get_architecture_ids();
[algs, nmAlg] = get_algorithm_list();
algs = algs(1:2);  nmAlg = nmAlg(1:2);           % so GD e Adam tem learning rate
budget = get_config_field(D.cfg, 'budget', 1000);
TUNE = load_results_from_mat(tuneFile, 'TUNE');
o = fill_default_options(struct('budget', budget));
LRd = zeros(3, 2);
Rs = cell(3, 2);
for g = 1:2                                   % por algoritmo: GD (A, B, C), depois Adam (A, B, C)
    print_and_log(logFile, sprintf('\n######## %s - afinacao do learning rate - %s ########', D.name, nmAlg{g}));
    for a = 1:3
        lay = get_architecture_layers(archs{a}, P.d, N);
        key = sprintf('%s_%s_%s', D.name, archs{a}, algs{g});
        if isfield(TUNE, key)
            R = TUNE.(key);
            print_and_log(logFile, sprintf('  %s: ja afinado (carregado de %s), lr escolhido %.0e', ...
                    key, tuneFile, R.lrBest));
        else
            print_and_log(logFile, sprintf('Tuning %s (budget %d)', key, budget));
            R = tune_learning_rate(algs{g}, lay, P, lrGrid.(algs{g}), seeds, o, logFile);
            save_result_to_mat(tuneFile, 'TUNE', key, R);
        end
        if ~isfield(R, 'nExt'), R.nExt = 0; end
        while R.edge && R.nExt < 2
            if R.best == 1, newLr = R.lrs(1) / sqrt(10); else newLr = R.lrs(end) * sqrt(10); end
            print_and_log(logFile, sprintf('Grelha alargada %s: lr = %.2e', key, newLr));
            R2 = tune_learning_rate(algs{g}, lay, P, newLr, seeds, o, logFile);
            nExt = R.nExt + 1;
            R = merge_tuning_results(R, R2);
            R.nExt = nExt;
            save_result_to_mat(tuneFile, 'TUNE', key, R);
        end
        Rs{a, g} = R;
        LRd(a, g) = R.lrBest;
    end
end
fprintf('\n%s - afinacao do learning rate (orcamento %d; mediana da melhor MSE de validacao, %d repeticoes):\n', ...
        D.name, budget, numel(seeds));
archNames = get_architecture_names(P.d, N);
for a = 1:3
    for g = 1:2
        R = Rs{a, g};
        fprintf('  %s %-4s |', archs{a}, algs{g});
        for i = 1:numel(R.lrs)
            if i == R.best, mk = '*'; else mk = ' '; end
            fprintf(' %.0e:%.4f%s', R.lrs(i), R.median(i), mk);
        end
        fprintf(' | escolhido %.0e (%.4f +/- %.4f)', R.lrBest, R.mean(R.best), R.std(R.best));
        if R.edge, fprintf('  <- no limite da grelha'); end
        if any(R.failed(:)), fprintf('  [%d runs divergiram]', sum(R.failed(:))); end
        fprintf('\n');
    end
end
plot_learning_rate_tuning(Rs(:, 1)', Rs(:, 2)', archNames, ['Afinacao do learning rate - ' D.name]);
save_figure_png(['tuning_' lower(D.name)], figDir);
end

function Es = run_final_experiments(D, P, LRd, seeds, finalFile, logFile, N)
% Experiencias finais de um dataset, por esta ordem:
%   para cada algoritmo (GD, Adam, BFGS)
%     para cada arquitetura (A, B, C)
%       numel(seeds) runs  (orcamento = cfg.budget)
% Mostra um cabecalho e um resumo de cada bloco. Es{a}.(alg) = resultados da
% arquitetura a com esse algoritmo (ver train_algorithm_runs). Grava em finalFile
% (FINAL.<nome>_<arq>.<alg>) depois de cada run; o que ja esta feito e
% carregado e nao volta a correr.
archs = get_architecture_ids();
[algs, nmAlg] = get_algorithm_list();
budget = get_config_field(D.cfg, 'budget', 1000);
nR = numel(seeds);
FINAL = load_results_from_mat(finalFile, 'FINAL');
Es = cell(1, 3);
for a = 1:3
    key = sprintf('%s_%s', D.name, archs{a});
    if isfield(FINAL, key), Es{a} = FINAL.(key); else Es{a} = struct(); end
    Es{a}.seeds = seeds;  Es{a}.lrs = LRd(a, :);  Es{a}.budget = budget;
    Es{a}.layers = get_architecture_layers(archs{a}, P.d, N);
end
for g = 1:3
    print_and_log(logFile, sprintf('\n######## %s - %s ########', D.name, nmAlg{g}));
    for a = 1:3
        key = sprintf('%s_%s', D.name, archs{a});
        [lay, nmArch] = get_architecture_layers(archs{a}, P.d, N);
        if g < 3, lrTxt = sprintf('lr %.0e', LRd(a, g)); lr = LRd(a, g); else lrTxt = 'line search'; lr = []; end
        print_and_log(logFile, sprintf('=== %s | %s | %s (%d parametros, %s, orcamento %d) ===', ...
                D.name, nmAlg{g}, nmArch, count_params(lay), lrTxt, budget));
        if isfield(Es{a}, algs{g}), S = Es{a}.(algs{g}); else S = []; end
        if ~isempty(S) && ~isfield(S, 'done')
            S.done = Es{a}.done;               % resultados gravados pela versao anterior
        end
        if ~isempty(S) && S.done >= nR
            print_and_log(logFile, sprintf('    %d/%d runs ja feitas (carregadas de %s)', S.done, nR, finalFile));
        else
            saveFn = @(Sx) save_algorithm_result(finalFile, key, algs{g}, Sx, Es{a});
            S = train_algorithm_runs(algs{g}, lay, P, lr, budget, seeds, S, saveFn, logFile, D.unit);
        end
        Es{a}.(algs{g}) = S;
        v = S.rmse(~isnan(S.rmse));
        print_and_log(logFile, sprintf(['    -> RMSE teste: mediana %.3f %s (Q1 %.3f, Q3 %.3f) | media %.3f +/- %.3f | ' ...
                'R2 medio %.3f | tempo medio %.1f s | divergiram %d'], quantile_linear(v, 0.5), D.unit, ...
                quantile_linear(v, 0.25), quantile_linear(v, 0.75), mean(v), std(v), mean(S.r2(~isnan(S.r2))), ...
                mean(S.elapsed(~isnan(S.elapsed))), sum(S.failed)));
    end
end
end

function save_algorithm_result(file, key, alg, S, meta)
% Grava os resultados de um algoritmo em FINAL.<key>.<alg> sem apagar os
% outros algoritmos da mesma arquitetura.
F = load_results_from_mat(file, 'FINAL');
if isfield(F, key), E = F.(key); else E = struct(); end
E.seeds = meta.seeds;  E.lrs = meta.lrs;  E.budget = meta.budget;  E.layers = meta.layers;
E.(alg) = S;
save_result_to_mat(file, 'FINAL', key, E);
end

function report_results(D, P, Es, REF, N, fidT, figDir)
% Resultados (passo 8): curvas de treino e validacao (mediana e Q1-Q3, contra
% epoch-equivalentes e contra o tempo), tabela 3x3, MAE e melhor epoch, e
% boxplots do RMSE de teste com os modelos de referencia.
archs = get_architecture_ids();
[algs, nmAlg] = get_algorithm_list();
archNames = get_architecture_names(P.d, N);
for a = 1:3
    plot_training_curves(Es{a}, sprintf('%s - %s (lr GD %.0e, Adam %.0e)', D.name, archNames{a}, ...
                  Es{a}.lrs(1), Es{a}.lrs(2)), false);
    save_figure_png(sprintf('progresso_%s_%s', lower(D.name), archs{a}), figDir);
    plot_training_curves(Es{a}, sprintf('%s - %s (contra o tempo)', D.name, archNames{a}), true);
    save_figure_png(sprintf('progresso_tempo_%s_%s', lower(D.name), archs{a}), figDir);
end
hdr = sprintf('\n%s - teste (%d runs), unidades originais\n', D.name, numel(Es{1}.gd.rmse));
print_to_screen_and_file(hdr, fidT);
print_summary_table(Es, archNames, D.unit, fidT);
for a = 1:3
    for g = 1:3
        S = Es{a}.(algs{g});
        ln = sprintf('  %-15s %-14s MAE %.3f +/- %.3f | melhor epoch mediana %4.0f | gradientes completos %4.0f\n', ...
             archNames{a}, nmAlg{g}, mean(S.mae), std(S.mae), median(S.bestEpoch), median(S.nGrad));
        print_to_screen_and_file(ln, fidT);
    end
end
plot_test_rmse_boxplots(Es, archs, REF.rmse, REF.names, D.unit, ['RMSE de teste - ' D.name]);
save_figure_png(['boxplot_' lower(D.name)], figDir);
print_algorithm_comparison(D, Es, archNames, fidT);
plot_algorithm_comparison(Es, archNames, REF, D.unit, ['Comparacao dos algoritmos - ' D.name]);
save_figure_png(['comparacao_' lower(D.name)], figDir);
end

function print_algorithm_comparison(D, Es, archNames, fid)
% Comparacao direta dos 3 algoritmos, para cada arquitetura. As runs sao
% emparelhadas (run k: os mesmos pesos iniciais para GD, Adam e BFGS), por isso:
%  - vitorias : em quantas runs cada algoritmo teve o menor RMSE de teste
%  - rank medio (1 = melhor) do RMSE de teste nas runs
%  - teste de Wilcoxon emparelhado (sinais e ordens) entre cada par de
%    algoritmos, no RMSE de teste; p < 0.05 -> diferenca significativa
%  - velocidade: epoch-equivalentes e segundos ate a perda de validacao ficar
%    a menos de 5% do melhor valor dessa run (mediana das runs)
[algs, names, lbl] = get_algorithm_list();
pairs = [1 2; 1 3; 2 3];
out = sprintf('\n%s - comparacao direta dos algoritmos (RMSE de teste, %d runs emparelhadas)\n', ...
              D.name, numel(Es{1}.gd.rmse));
out = [out sprintf('%-15s %-5s %8s %9s %10s %12s %10s\n', 'Arquitetura', 'Alg.', 'vitorias', ...
       'rank med.', 'mediana', 'epochs a 5%', 'seg. a 5%')];
for a = 1:numel(Es)
    Rm = [Es{a}.gd.rmse(:) Es{a}.adam.rmse(:) Es{a}.bfgs.rmse(:)];   % runs x 3
    nR = size(Rm, 1);
    rk = zeros(nR, 3);
    for r = 1:nR, rk(r, :) = rank_values(Rm(r, :))'; end
    [mn, win] = min(Rm, [], 2);
    for g = 1:3
        [ep, sec] = time_to_reach_best_val(Es{a}.(algs{g}), 0.05);
        out = [out sprintf('%-15s %-5s %5d/%-2d %9.2f %10.3f %12.0f %10.2f\n', archNames{a}, lbl{g}, ...
               sum(win == g), nR, mean(rk(:, g)), median(Rm(:, g)), ep, sec)];
    end
    s = '  Wilcoxon emparelhado:';
    for k = 1:3
        i = pairs(k, 1);  j = pairs(k, 2);
        p = wilcoxon_signed_rank(Rm(:, i), Rm(:, j));
        if median(Rm(:, i) - Rm(:, j)) < 0, better = lbl{i}; else better = lbl{j}; end
        if p < 0.05, sig = sprintf('-> %s melhor', better); else sig = '-> sem diferenca'; end
        s = [s sprintf('  %s vs %s p = %.3f %s |', lbl{i}, lbl{j}, p, sig)];
    end
    out = [out s(1:end-1) sprintf('\n')];
end
print_to_screen_and_file(out, fid);
end

function [ep, sec] = time_to_reach_best_val(S, tol)
% Mediana (nas runs) do primeiro epoch-equivalente / segundo em que a perda de
% validacao fica a menos de tol (fracao) do melhor valor dessa run.
nR = size(S.val, 2);
e = nan(1, nR);  t = nan(1, nR);
for r = 1:nR
    v = S.val(:, r);
    k = find(v <= (1 + tol) * min(v), 1);
    if ~isempty(k), e(r) = k - 1;  t(r) = S.time(k, r); end
end
ep = median(e(~isnan(e)));
sec = median(t(~isnan(t)));
end

function p = wilcoxon_signed_rank(x, y)
% Teste de Wilcoxon dos sinais e ordens para amostras emparelhadas (bilateral,
% aproximacao normal com correcao de empates). Implementado sem toolbox.
d = x(:) - y(:);
d = d(d ~= 0);
n = numel(d);
if n == 0, p = 1; return; end
r = rank_values(abs(d));
W = sum(r(d > 0));
mu = n * (n + 1) / 4;
[u, i1, g] = unique(abs(d));
t = accumarray(g(:), 1);
sigma = sqrt(n * (n + 1) * (2 * n + 1) / 24 - sum(t .^ 3 - t) / 48);
z = (W - mu) / sigma;
p = erfc(abs(z) / sqrt(2));                 % = 2 * (1 - Phi(|z|))
end

function r = rank_values(x)
% Ordens de um vetor (empates ficam com a media das ordens).
x = x(:);
[sx, ix] = sort(x);
n = numel(x);
r = zeros(n, 1);
i = 1;
while i <= n
    j = i;
    while j < n && sx(j + 1) == sx(i), j = j + 1; end
    r(ix(i:j)) = (i + j) / 2;
    i = j + 1;
end
end

function plot_algorithm_comparison(Es, archNames, REF, unit, titleStr)
% RMSE de teste mediano (ponto) de cada algoritmo, agrupado por arquitetura,
% com o intervalo interquartil (traco Q1-Q3) e os modelos de referencia (linhas).
[algs, lbl] = get_algorithm_list();
cols = [0.1 0.3 0.8; 0.85 0.2 0.1; 0.1 0.6 0.2];
nA = numel(Es);
med = zeros(nA, 3);  q1 = zeros(nA, 3);  q3 = zeros(nA, 3);
for a = 1:nA
    for g = 1:3
        v = Es{a}.(algs{g}).rmse;
        med(a, g) = quantile_linear(v, 0.5);  q1(a, g) = quantile_linear(v, 0.25);  q3(a, g) = quantile_linear(v, 0.75);
    end
end
figure('Name', titleStr, 'Color', 'w', 'Position', [100 100 1000 520]);
hold on;
w = 0.25;
h = zeros(1, 3);
for g = 1:3
    x = (1:nA) + (g - 2) * w;
    for a = 1:nA
        line([x(a) x(a)], [q1(a, g) q3(a, g)], 'Color', cols(g, :), 'LineWidth', 2.5);
        hb = plot(x(a), med(a, g), 'o', 'MarkerSize', 9, 'MarkerFaceColor', cols(g, :), ...
                  'MarkerEdgeColor', 'k');
        if a == 1, h(g) = hb; end
        text(x(a) + 0.04, med(a, g), sprintf('%.2f', med(a, g)), 'FontSize', 8);
    end
end
hr = draw_reference_lines(REF.rmse, [0.5 nA + 0.5]);
hold off;
lo = min([q1(:); REF.rmse(:)]);  hi = max([q3(:); REF.rmse(:)]);
set(gca, 'XTick', 1:nA, 'XTickLabel', archNames, 'XLim', [0.5 nA + 0.5], ...
         'YLim', [lo - 0.15 * (hi - lo), hi + 0.15 * (hi - lo)]);
grid on;
ylabel(['RMSE de teste (' unit ')']);
legend([h hr], [lbl REF.names], 'Location', 'NorthEastOutside');
title([titleStr '  (ponto = mediana, traco = Q1-Q3)']);
end


% =====================================================================
%  UTILITARIOS
% =====================================================================

function save_figure_png(name, folder)
% Guarda a figura atual em PNG (para o relatorio).
if nargin < 2, folder = 'figuras'; end
if ~exist(folder, 'dir'), mkdir(folder); end
set(gcf, 'PaperPositionMode', 'auto');
print(gcf, '-dpng', '-r120', fullfile(folder, [name '.png']));
end

function add_figure_title(str)
% Titulo por cima de todos os subplots (a R2007a nao tem sgtitle).
% Encolhe um pouco os eixos que tocam no topo, para o titulo nao os tapar.
ax = gca;
axs = findobj(gcf, 'Type', 'axes');
for k = 1:numel(axs)
    tg = lower(get(axs(k), 'Tag'));
    if strcmp(tg, 'legend') || strcmp(tg, 'colorbar'), continue; end
    p = get(axs(k), 'Position');
    if p(2) + p(4) > 0.85
        set(axs(k), 'Position', [p(1), p(2), p(3), 0.85 - p(2)]);
    end
end
axes('Position', [0 0.955 1 0.04], 'Visible', 'off');
text(0.5, 0.5, str, 'HorizontalAlignment', 'center', 'FontSize', 12, 'FontWeight', 'bold');
axes(ax);
end

function cmap = blue_white_red_colormap(n)
% Mapa de cores azul - branco - vermelho.
h = floor(n / 2);
cmap = [linspace(0, 1, h)' linspace(0, 1, h)' ones(h, 1); ...
        ones(n - h, 1) linspace(1, 0, n - h)' linspace(1, 0, n - h)'];
end

function h = draw_reference_lines(values, xlimits)
% Linhas horizontais (tracejado, pontilhado, traco-ponto) nos valores dados,
% entre xlimits(1) e xlimits(2). Devolve os handles para a legenda.
lst = {'--', ':', '-.'};
h = zeros(1, numel(values));
for k = 1:numel(values)
    h(k) = plot(xlimits, [values(k) values(k)], lst{mod(k - 1, 3) + 1}, ...
                'Color', [0.2 0.2 0.2], 'LineWidth', 1.5);
end
end

function s = compute_boxplot_stats(v)
% Estatisticas de um boxplot (regra 1.5*IQR), sem Statistics Toolbox.
v = sort(v(~isnan(v)));
s.q1 = quantile_linear(v, 0.25);  s.med = quantile_linear(v, 0.5);  s.q3 = quantile_linear(v, 0.75);
iqr = s.q3 - s.q1;
isOut = v < s.q1 - 1.5 * iqr | v > s.q3 + 1.5 * iqr;
s.lo = min(v(~isOut));  s.hi = max(v(~isOut));
s.out = v(isOut);
end

function draw_boxplot(s, pos, col, horizontal, w)
% Desenha uma caixa de boxplot na posicao pos (sem Statistics Toolbox).
if horizontal
    patch([s.q1 s.q3 s.q3 s.q1], [pos-w pos-w pos+w pos+w], col, 'EdgeColor', 'k');
    line([s.med s.med], [pos-w pos+w], 'Color', 'k', 'LineWidth', 2);
    line([s.lo s.q1], [pos pos], 'Color', 'k');
    line([s.q3 s.hi], [pos pos], 'Color', 'k');
    line([s.lo s.lo], [pos-w/2 pos+w/2], 'Color', 'k');
    line([s.hi s.hi], [pos-w/2 pos+w/2], 'Color', 'k');
    if ~isempty(s.out)
        line(s.out, pos * ones(size(s.out)), 'LineStyle', 'none', 'Marker', '.', 'Color', 'r');
    end
else
    patch([pos-w pos+w pos+w pos-w], [s.q1 s.q1 s.q3 s.q3], col, 'EdgeColor', 'k');
    line([pos-w pos+w], [s.med s.med], 'Color', 'k', 'LineWidth', 2);
    line([pos pos], [s.lo s.q1], 'Color', 'k');
    line([pos pos], [s.q3 s.hi], 'Color', 'k');
    line([pos-w/2 pos+w/2], [s.lo s.lo], 'Color', 'k');
    line([pos-w/2 pos+w/2], [s.hi s.hi], 'Color', 'k');
    if ~isempty(s.out)
        line(pos * ones(size(s.out)), s.out, 'LineStyle', 'none', 'Marker', '.', 'Color', 'r');
    end
end
end

function yc = compute_normal_curve(x, mu, sd, n, binWidth)
% Contagens esperadas de uma normal(mu, sd) num histograma com n valores e
% classes de largura binWidth, nos pontos x (curva desenhada sobre histogramas).
yc = n * binWidth * exp(-0.5 * ((x - mu) / sd) .^ 2) / (sd * sqrt(2 * pi));
end

function q = quantile_linear(v, p)
% Quantil p (0..1) com interpolacao linear (v nao precisa de vir ordenado).
v = sort(v(~isnan(v)));
k = numel(v);
pos = 1 + (k - 1) * p;
lo = floor(pos);  hi = ceil(pos);
q = v(lo) + (pos - lo) * (v(hi) - v(lo));
end

function s = skewness_value(x)
% Assimetria (skewness) de um vetor.
x = x(~isnan(x));
sd = std(x, 1);
if sd == 0, s = 0; else s = mean(((x - mean(x)) / sd).^3); end
end
