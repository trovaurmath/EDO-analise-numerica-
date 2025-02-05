# EDO — Análise Numérica
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![R 4.0+](https://img.shields.io/badge/R->=4.0-blue.svg)](https://cran.r-project.org/)

> Repositório com exemplos de **Cálculo Numérico** aplicados a **Equações Diferenciais Ordinárias (EDOs)** em **R**, focados na Lei de Resfriamento de Newton.

---

## Visão Geral

Este repositório fornece dois exemplos numéricos usando o pacote [`deSolve`](https://cran.r-project.org/web/packages/deSolve/index.html):

- **Exemplo 1**: Lei de Resfriamento de Newton com ambiente de temperatura fixa.

  $$
  \frac{dT}{dt} \;=\; -\,k\,\bigl[T(t) \;-\; T_{\text{env}}\bigr], 
  \quad T(0) \;=\; T_0
  $$

- **Exemplo 2**: Lei de Resfriamento de Newton com ambiente de temperatura variável.

  $$
  \frac{dT}{dt} \;=\; -\,k\,\bigl[T(t) \;-\; T_{\text{env}}(t)\bigr], 
  \quad T(0) \;=\; T_0
  $$

Cada exemplo ilustra como resolver EDOs em **R** e, no primeiro caso, comparar a solução numérica com a **solução analítica**.

---

## Estrutura do Projeto

- **`codigo_EDOs.R`**  
  - Declaração de parâmetros (temperaturas, constante de resfriamento, etc.).
  - Definição das funções de EDO para cada exemplo.
  - Resolução numérica via `ode()` (do pacote `deSolve`).
  - Comparações numérico x analítico (Exemplo 1).
  - Plot de gráficos com `plot()` e `lines()`.

- **`img/`**  
  - Diretório onde você poderá inserir futuras imagens, capturas de tela ou gráficos gerados pelo script.

---

## Como Executar

1. **Instale o R** (versão 4.0 ou superior).  
   - Opcional: instale também o [RStudio](https://www.rstudio.com/).

2. **Clone** este repositório ou baixe os arquivos.

3. **Instale o pacote `deSolve`** (se ainda não tiver no seu R):
   ```r
   install.packages("deSolve")
