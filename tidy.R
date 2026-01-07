library(tidyverse)

# Verano 2025 ------------------------------------------------------------------

# Lee la hoja de cálculo y elimina celdas sin información
datos_fecales <- readxl::read_xlsx(
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

# Fusiona las columnas de fecha y hora en un único instante de tiempo.
datos_fecales <- datos_fecales |> mutate(
  Fecha = if_else(
    is.na(Hora), Fecha, Fecha + hour(Hora)*60*60 + minute(Hora)*60),
  .keep="unused") 

# Aproxima los valores "<10" a 10.
datos_fecales <- datos_fecales |> mutate(
  E.coli.Hidrotecnia = parse_number(E.coli.Hidrotecnia)
  )

# Junta las columnas con valores UFC en una única variable.
datos_fecales <- datos_fecales |> pivot_longer(
  starts_with("E"), names_to = c("Parametro"), values_to = "UFC")

# Especifica las categorías (organismo y laboratorio) para cada valor UFC.
datos_fecales <- datos_fecales |> separate_wider_regex(
  Parametro, c(Organismo = "E\\.coli|Enterococos",
               "\\.",
               Laboratorio = "Hidrotecnia|Sanidad"))

datos_fecales |> write_rds("data/datos-fecales.rds")

# Históricos Hidrotecnia -------------------------------------------------------

# Lee la hoja de cálculo