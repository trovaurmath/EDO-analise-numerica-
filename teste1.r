###########################################################
# DEMONSTRAÇÃO DE DUAS EDOs EM TERMODINÂMICA
#   USANDO O PACOTE deSolve EM R
###########################################################

# 1) Instale (se necessário) e carregue o pacote "deSolve"
# install.packages("deSolve")
library(deSolve)

# (Opcional) limpar ambiente e gráficos
rm(list=ls())
graphics.off()


###########################################################
# EXEMPLO 1: LEI DE RESFRIAMENTO DE NEWTON (AMBIENTE FIXO)
###########################################################
# EDO: dT/dt = -k [T(t) - Tenv],   T(0) = T0
#
# Com Tenv constante, a solução analítica é:
# T(t) = Tenv + (T0 - Tenv) * exp(-k*t)

# 1.1) Definindo parâmetros e condição inicial
T0_ex1   <- 80      # Temperatura inicial do corpo (°C)
Tenv_ex1 <- 25      # Temperatura ambiente constante (°C)
k_ex1    <- 0.1     # Constante de resfriamento (1/unid. tempo)
tmax_ex1 <- 50      # Vamos simular 50 unidades de tempo (ex.: minutos)

# 1.2) Função da EDO p/ deSolve
cooling_fixed <- function(t, state, parms) {
  with(as.list(c(state, parms)), {
    # dT/dt = -k * (T - Tenv)
    dT <- -k * (T - Tenv)
    return(list(c(dT)))
  })
}

# Empacotamos o estado inicial e parâmetros para o solver
state1  <- c(T = T0_ex1)
parms1  <- c(k = k_ex1, Tenv = Tenv_ex1)

# 1.3) Resolvendo numericamente
times1  <- seq(0, tmax_ex1, by = 1)
out1    <- ode(y = state1, times = times1,
               func = cooling_fixed, parms = parms1)

# 1.4) Solução analítica (para comparação)
#     T_exato(t) = Tenv + (T0 - Tenv)*exp(-k*t)
T_analit <- function(t) {
  Tenv_ex1 + (T0_ex1 - Tenv_ex1)*exp(-k_ex1*t)
}

# 1.5) Criar um data frame com comparação numérica vs exata
#     out1 é uma matriz; primeira coluna = tempo, segunda coluna = T
df1 <- data.frame(
  time = out1[, "time"],
  T_num = out1[, "T"]
)
# Adicionando a coluna de T_exato e o erro
df1$T_exact = T_analit(df1$time)
df1$diff    = df1$T_num - df1$T_exact

# 1.6) Mostrar alguns dados numéricos
cat("\n######### EXEMPLO 1 #########\n")
cat("Head do resultado:\n")
print(head(df1, 10))  # Mostra as 10 primeiras linhas

# 1.7) Plotar
# Plotamos a solução numérica e sobrepomos a solução exata
plot(df1$time, df1$T_num, type="o", pch=16, col="blue",
     main="EXEMPLO 1: Newton Cooling (ambiente fixo)",
     xlab="Tempo", ylab="Temperatura (°C)")
lines(df1$time, df1$T_exact, col="red", lwd=2)
grid()
legend("topright",
       legend=c("Numérico", "Analítico"),
       col=c("blue","red"), pch=c(16,NA), lty=c(NA,1))


###########################################################
# EXEMPLO 2: LEI DE RESFRIAMENTO (AMBIENTE VARIÁVEL)
###########################################################
# EDO: dT/dt = -k [T(t) - Tenv(t)],   T(0) = T0
#
# Agora Tenv(t) não é constante. Vamos modelar algo como:
#   Tenv(t) = 25 + 5*sin(0.2*t)
# Assim, a EDO não tem solução elementar simples.

# 2.1) Parâmetros e condição inicial
T0_ex2    <- 80      # Temperatura inicial do corpo
k_ex2     <- 0.1     # taxa de resfriamento
tmax_ex2  <- 50      # tempo máximo simulado

# Definimos também a função Tenv(t)
Tenv2 <- function(t) 25 + 5*sin(0.2*t)

# 2.2) Função da EDO p/ deSolve
# Precisamos avaliar Tenv2 no tempo "t"
cooling_var <- function(t, state, parms) {
  T  <- state["T"]
  k  <- parms["k"]
  
  # Avaliar Tenv(t)
  Tenvt <- 25 + 5*sin(0.2*t)
  
  # dT/dt = -k [T - Tenv(t)]
  dT <- -k * (T - Tenvt)
  
  return(list(c(dT)))
}

# Estado inicial e parâmetros
state2 <- c(T = T0_ex2)
parms2 <- c(k = k_ex2)

# 2.3) Resolver numericamente
times2 <- seq(0, tmax_ex2, by=1)
out2   <- ode(y=state2, times=times2, func=cooling_var, parms=parms2)

# 2.4) Montar data frame e exibir
df2 <- data.frame(
  time = out2[, "time"],
  T_num = out2[, "T"]
)
# Para referência, também salvamos Tenv(t) no mesmo data frame
df2$T_env = Tenv2(df2$time)

cat("\n######### EXEMPLO 2 #########\n")
cat("Head do resultado (ambiente variável):\n")
print(head(df2, 10))

# 2.5) Plotar
plot(df2$time, df2$T_num, type="o", pch=16, col="blue",
     main="EXEMPLO 2: Newton Cooling (ambiente variável)",
     xlab="Tempo", ylab="Temperatura (°C)")
# Podemos sobrepor a curva do ambiente para comparar
lines(df2$time, df2$T_env, col="darkgreen", lwd=2)
grid()
legend("topright",
       legend=c("Corpo (numérico)", "Ambiente(t)"),
       col=c("blue","darkgreen"), pch=c(16,NA), lty=c(NA,1))

###########################################################
# FIM DO SCRIPT
###########################################################
