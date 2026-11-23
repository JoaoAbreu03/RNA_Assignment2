# Assignment 2 – Redes Neuronais Artificiais (2026/27)

Regressão com redes neuronais feed-forward: comparação de **3 arquiteturas** (A, B, C) e **3 algoritmos de treino** (mini-batch GD, Adam e BFGS) em **2 datasets**:

| Dataset | Tipo | Alvo |
|---|---|---|
| `Concrete_Data.csv` (UCI) | regressão estática | resistência do betão (MPa) |
| `daily-minimum-temperatures-in-me.csv` (Kaggle) | série temporal | temperatura mínima do dia seguinte (°C) |

## Ficheiros

| Ficheiro | O que é |
|---|---|
| `main_assignment2.m` | Script que corre o estudo completo (é o único que se corre) |
| `ann_lib.m` | Biblioteca com todas as funções; `L = ann_lib()` devolve uma estrutura com um handle por função |
| `Concrete_Data.csv`, `daily-minimum-temperatures-in-me.csv` | Dados |
| `figuras/` | Figuras geradas (PNG), criada pelo script |
| `resultados/` | Resultados gravados, criada pelo script (ver abaixo) |

## Como correr

1. Abrir o MATLAB (R2007a ou mais recente) ou o GNU Octave.
2. Mudar para esta pasta:
   ```matlab
   cd('C:\Redes Neuronais\projeto 2\matlab')
   ```
3. Correr:
   ```matlab
   main_assignment2
   ```

Não é preciso correr o `ann_lib.m`: o main chama-o. O main começa com `clear all; rehash;`, por isso usa sempre a versão atual da biblioteca.

### Tempo de execução

| Situação | Tempo |
|---|---|
| Primeira vez (sem a pasta `resultados/`) | ~3h15 (afinação ~1h10 + 540 treinos ~2h05) |
| Com os resultados já gravados | ~2 minutos (só gera figuras e tabelas) |
| Teste rápido (`QUICK = true`) | ~10 minutos + afinação, se ainda não existir |

Durante uma execução longa o computador não deve suspender (o tempo medido de cada treino ficaria errado).

### Retomar e repetir

Os resultados são gravados **depois de cada configuração/run**. Se o script for interrompido, ao correr outra vez continua onde parou e não repete o que já está feito.

- Para **refazer tudo de raiz**: apagar a pasta `resultados/` (ou só `tuning.mat` / `final.mat`).
- Para **testar o código depressa**: pôr `QUICK = true` no topo do main (2 runs em vez de 30, gravadas em `final_quick.mat`).

## Configuração (topo do `main_assignment2.m`)

| Variável | Valor | Significado |
|---|---|---|
| `SEED` | 42 | Seed da divisão dos dados (Concrete) e da verificação do gradiente |
| `QUICK` | `false` | `true` = teste rápido com 2 runs |
| `fracs` | `[0.70 0.15 0.15]` | Treino / validação / teste |
| `N` | 10 | Neurónios da rede de referência |
| `lrGrid.gd`, `lrGrid.adam` | 6 valores logarítmicos | Learning rates testados na afinação |
| `tuneSeeds` | 42 a 46 | 5 repetições por learning rate na afinação |
| `finalSeeds` | 1 a 30 | 30 runs por combinação nas experiências finais |

Cada dataset tem a sua estrutura `cfg` (`cfgC`, `cfgM`): ficheiro, nomes e unidades das colunas, orçamento (`budget`: 1000 epoch-equivalentes no Concrete, 500 em Melbourne) e as escolhas de limpeza e de features.

## Estrutura do main

O main tem uma parte de configuração comum e depois **uma parte inteira por dataset**, com as mesmas etapas (a ordem do ciclo de ciência de dados):

| Etapa | Concrete | Melbourne | O que faz |
|---|---|---|---|
| 1 | A.1 | B.1 | Leitura e inspeção inicial |
| 2 | A.2 | B.2 | Limpeza dos dados |
| 3 | A.3 | B.3 | Análise exploratória (EDA) |
| 4 | A.4 | B.4 | Feature engineering |
| 5 | A.5 | B.5 | Divisão treino / validação / teste |
| 6 | A.6 | B.6 | Normalização (só com o treino) |
| 7 | A.7 | B.7 | Modelos de referência |
| 8 | A.8 | B.8 | Arquiteturas e verificação do gradiente |
| 9 | A.9 | B.9 | Afinação do learning rate (validação) |
| 10 | A.10 | B.10 | Experiências finais (30 runs) |
| 11 | A.11 | B.11 | Resultados e avaliação no teste |

As funções da biblioteca são genéricas: servem para qualquer CSV numérico. Um CSV com uma coluna de datas é tratado como série temporal; sem datas, como regressão estática.

### Experiências finais (etapa 10)

Para cada dataset, por esta ordem:

```
para cada algoritmo (GD, Adam, BFGS)
    para cada arquitetura (A, B, C)
        30 runs (seeds 1 a 30)
```

Na run *k*, os três algoritmos partem dos **mesmos pesos iniciais** (seed *k*), por isso a comparação é emparelhada. Cada algoritmo devolve o modelo com a menor perda de validação, que é depois avaliado no teste.

## Resultados gerados

**Pasta `resultados/`**

| Ficheiro | Conteúdo |
|---|---|
| `tuning.mat` | Afinação do learning rate (erro de validação por learning rate e seed) |
| `final.mat` | As 540 runs finais: curvas de treino/validação, métricas de teste, previsões, tempos |
| `tabelas.txt` | Tabelas finais (referências, tabela 3×3, MAE, comparação dos algoritmos) |
| `progresso.txt` | Registo do progresso, com a hora de cada passo |
| `output_main.txt` | Cópia de tudo o que o main escreve no ecrã |

**Pasta `figuras/`**

| Figuras | Conteúdo |
|---|---|
| `concrete_*`, `melbourne_*` | EDA, escolha da janela p e divisão cronológica |
| `tuning_*` | Afinação do learning rate |
| `progresso_*`, `progresso_tempo_*` | Curvas de treino e validação (mediana e Q1–Q3) contra epoch-equivalentes e contra o tempo |
| `boxplot_*` | RMSE de teste das 9 combinações |
| `comparacao_*` | Comparação direta dos algoritmos |
| `previsoes_*` | Previsões no teste e histograma dos resíduos |

## Requisitos

- MATLAB R2007a ou mais recente, ou GNU Octave.
- Sem toolboxes: ACF/PACF, boxplots e o teste de Wilcoxon estão implementados na biblioteca.
