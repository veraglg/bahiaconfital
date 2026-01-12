library(tidyverse)

indicadores_fecales <- read_rds("data/indicadores-fecales.rds")

# Datos UFC uno por fila -------------------------------------------------------

# Fusiona las columnas de fecha y hora en un único instante de tiempo.
indicadores_fecales <- indicadores_fecales |> mutate(
  Fecha = if_else(
    is.na(Hora), Fecha, Fecha + hour(Hora)*60*60 + minute(Hora)*60),
  .keep="unused") 

# Aproxima los valores "<10" a 10.
indicadores_fecales <- indicadores_fecales |> mutate(
  E.coli.Hidrotecnia = parse_number(E.coli.Hidrotecnia)
)

# Junta las columnas con valores UFC en una única variable.
indicadores_fecales <- indicadores_fecales |> pivot_longer(
  starts_with("E"), names_to = c("Parametro"), values_to = "UFC")

# Especifica las categorías (organismo y laboratorio) para cada valor UFC.
indicadores_fecales <- indicadores_fecales |> separate_wider_regex(
  Parametro, c(Organismo = "Enterococos|E\\.coli",
               "\\.",
               Agente = "Hidrotecnia|Sanidad"))

# Escribe los datos en un fichero
indicadores_fecales |> write_rds("data/UFC.rds")

# Datos emparejados por muestras de agua ---------------------------------------

# Limpia de valores desemparejados
indicadores_fecales <- indicadores_fecales |> pivot_wider(
  names_from = Agente, values_from = UFC) |> 
  filter(!is.na(Hidrotecnia), !is.na(Sanidad))

# Guarda los valores emparejados en la misma fila
indicadores_fecales |> write_rds("data/UFC-emparejadas-fila.rds")

# Transforma a un valor por fila
indicadores_fecales <- indicadores_fecales |> pivot_longer(
  c("Hidrotecnia", "Sanidad"), names_to = "Agente", values_to = "UFC")

# Guarda los valores emparejados uno por fila
indicadores_fecales |> write_rds("data/UFC-emparejadas.rds")

# Límites de calidad de agua insuficiente --------------------------------------

# Crea una tibble con los organismos y su valor límite de insuficiencia.
tibble(Organismo = c("E.coli", "Enterococos"), Insuficiente = c(500, 200)) |> 
  write_rds("data/limites.rds")