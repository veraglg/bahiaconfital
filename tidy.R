library(tidyverse)

# Verano 2025 ------------------------------------------------------------------

# Lee la hoja de cálculo y elimina celdas sin información
indicadores_fecales <- readxl::read_xlsx(
  "data/Hidrotecnia_Sanidad_ULPGC-indicadores_fecales_verano_2025.xlsx",
  col_names = c("Fecha", "T", "Marea", "Hora",
                "E.coli.Hidrotecnia", "E.coli.Sanidad",
                "Enterococos.Hidrotecnia", "Enterococos.Sanidad",
                "skip", "skip", "Muestra.ULPGC"),
  col_types = c("guess", "guess", "text", "guess",
                "guess", "guess",
                "guess", "guess",
                "skip", "skip", "text"),
  range = "A3:K23")

indicadores_fecales |> write_rds("data/indicadores-fecales.rds")

# Históricos Hidrotecnia -------------------------------------------------------

# Lee la hoja de cálculo