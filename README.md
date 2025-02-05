# EDO — Análise Numérica em R

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![R 4.0+](https://img.shields.io/badge/R->=4.0-blue.svg)](https://cran.r-project.org/)

Seja bem-vindo(a) ao repositório **EDO — Análise Numérica**!  
Aqui você encontrará exemplos práticos de resolução de **Equações Diferenciais Ordinárias (EDOs)** em **R**, utilizando a famosa **Lei de Resfriamento de Newton**.

---

## 🎯 Visão Geral

Este projeto apresenta dois casos de estudo, demonstrando como utilizar o pacote [**deSolve**](https://cran.r-project.org/web/packages/deSolve/index.html) para resolver EDOs.

### Exemplo 1: Resfriamento com Ambiente de Temperatura Fixa

**Equação:**

<p align="center">
  <img src="https://latex.codecogs.com/png.latex?\dpi{120}\boldsymbol{\frac{dT}{dt}=-k\%5BT(t)-T_{env}\%5D,\quad%20T(0)=T_0}" alt="Equação de resfriamento com ambiente fixo">
</p>

**Dedução:**

A equação parte da hipótese de que a taxa de variação da temperatura de um objeto é proporcional à diferença entre a temperatura do objeto e a do ambiente. Assim:

1. **Hipótese:**  
   <p align="center">
     <img src="https://latex.codecogs.com/png.latex?\dpi{120}\boldsymbol{\frac{dT}{dt}\propto-\%5BT(t)-T_{env}\%5D}" alt="Hipótese">
   </p>
   O sinal negativo indica que, se *T(t)* > *T<sub>env</sub>*, o objeto esfria.

2. **Constante de proporcionalidade:**  
   Introduz-se a constante positiva *k* (coeficiente de resfriamento) para obter:
   <p align="center">
     <img src="https://latex.codecogs.com/png.latex?\dpi{120}\boldsymbol{\frac{dT}{dt}=-k\%5BT(t)-T_{env}\%5D}" alt="Constante de proporcionalidade">
   </p>

3. **Condição inicial:**  
   Define-se *T(0) = T<sub>0</sub>*, estabelecendo a temperatura inicial do objeto.

Essa equação pode ser resolvida por separação de variáveis, permitindo a obtenção da solução analítica que será comparada com a numérica.

---

### Exemplo 2: Resfriamento com Ambiente de Temperatura Variável

**Equação:**

<p align="center">
  <img src="https://latex.codecogs.com/png.latex?\dpi{120}\boldsymbol{\frac{dT}{dt}=-k\%5BT(t)-T_{env}(t)\%5D,\quad%20T(0)=T_0}" alt="Equação de resfriamento com ambiente variável">
</p>

**Dedução:**

Nesse cenário, a temperatura ambiente *T<sub>env</sub>(t)* varia com o tempo. A dedução é similar:

1. **Hipótese:**  
   A taxa de variação é proporcional à diferença entre *T(t)* e *T<sub>env</sub>(t)*:
   <p align="center">
     <img src="https://latex.codecogs.com/png.latex?\dpi{120}\boldsymbol{\frac{dT}{dt}\propto-\%5BT(t)-T_{env}(t)\%5D}" alt="Hipótese">
   </p>

2. **Constante de proporcionalidade:**  
   Introduz-se a constante positiva *k* para obter:
   <p align="center">
     <img src="https://latex.codecogs.com/png.latex?\dpi{120}\boldsymbol{\frac{dT}{dt}=-k\%5BT(t)-T_{env}(t)\%5D}" alt="Constante de proporcionalidade">
   </p>

3. **Condição inicial:**  
   A condição *T(0) = T<sub>0</sub>* define o estado inicial do sistema.

Essa formulação permite simular situações onde a temperatura ambiente oscila ou segue uma tendência determinada.

---

## 🚀 Estrutura do Projeto

- **`codigo_EDOs.R`**  
  - **Configuração de parâmetros:** Define temperaturas, constante de resfriamento, etc.
  - **Definição das EDOs:** Funções que descrevem as equações de resfriamento.
  - **Resolução Numérica:** Utiliza a função `ode()` do pacote **deSolve** para integrar as EDOs.
  - **Comparação de Soluções:** No Exemplo 1, a solução numérica é comparada com a solução analítica.
  - **Visualização:** Geração de gráficos com `plot()` e `lines()` para facilitar a interpretação dos resultados.

- **`img/`**  
  - Pasta destinada à inclusão de imagens, gráficos ou capturas de tela gerados a partir dos scripts.

---

## 📚 Como Executar

Siga os passos abaixo para colocar o projeto em funcionamento:

1. **Instale o R** (versão 4.0 ou superior)  
   - [Download do R](https://cran.r-project.org/)

2. *(Opcional)* **Instale o RStudio** para uma melhor experiência no desenvolvimento  
   - [Download do RStudio](https://www.rstudio.com/)

3. **Clone o repositório** ou faça o download dos arquivos:
   ```bash
   git clone https://github.com/seu-usuario/nome-do-repositorio.git
