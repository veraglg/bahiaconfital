library(tidyverse)

# Carga los archivos de datos
ufc_emp_fila <- read_rds("data/UFC-emparejadas-fila.rds")
ufc <- read_rds("data/UFC.rds")

# Hay diferencias significativas de enterococos según la fase de la marea?
aov_ei_marea <- aov(UFC ~ Marea, data = ufc |> filter(
  Organismo == "Enterococos", !is.na(UFC)))
save(aov_ei_marea, file = "data/aov-ei-marea.RData")

# Hay diferencias significativas de E.coli según la fase de la marea?
aov_ecoli_marea <- aov(UFC ~ Marea, data = ufc |> filter(
  Organismo == "E.coli", !is.na(UFC)))
save(aov_ecoli_marea, file = "data/aov-ecoli-marea.RData")

# Hay diferencias significativas de enterococos según el agente de muestreo?
t_test_ei_agente <- t.test(
  ufc_emp_fila[ufc_emp_fila$Organismo == "Enterococos",]$Sanidad,
  ufc_emp_fila[ufc_emp_fila$Organismo == "Enterococos",]$Hidrotecnia,
  paired = TRUE)
save(t_test_ei_agente, file = "data/t-test-ei-agente.RData")

# Hay diferencias significativas de E.coli según el agente de muestreo?
t_test_ecoli_agente <- t.test(
  ufc_emp_fila[ufc_emp_fila$Organismo == "E.coli",]$Sanidad,
  ufc_emp_fila[ufc_emp_fila$Organismo == "E.coli",]$Hidrotecnia,
  paired = TRUE)
save(t_test_ecoli_agente, file = "data/t-test-ecoli-agente.RData")