library(tidyverse)

datos_fecales <- read_rds("data/UFC.rds")

aov_ei_marea <- aov(UFC ~ Marea, data = datos_fecales |> filter(
  Organismo == "Enterococos", !is.na(UFC)))
save(aov_ei_marea, file = "data/aov-ei-marea.RData")

aov_ecoli_marea <- aov(UFC ~ Marea, data = datos_fecales |> filter(
  Organismo == "E.coli", !is.na(UFC)))
save(aov_ecoli_marea, file = "data/aov-ecoli-marea.RData")
