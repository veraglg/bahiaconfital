library(tidyverse)

# Semilla para reproducibilidad de los jitter
set.seed("1312")

datos_fecales <- read_rds("data/datos-fecales.rds")

# Vista general verano 2025
datos_fecales |> filter(!is.na(UFC)) |> 
  filter(!(Organismo == "E.coli" & UFC > 200)) |> 
  ggplot(aes(Fecha, UFC, fill = Agente)) +
  geom_area(color = "black", position = "dodge", alpha = .6) +
  facet_wrap(~Organismo, nrow = 2, scale = "free_y") +
  scale_x_datetime(date_labels = "%y-%m-%d") +
  scale_fill_manual(values = c("#2A788E", "#7AD151")) +
  labs(title = "Indicadores fecales verano 2025",
       subtitle = "Mayor detección de Enterococos por Sanidad.",
       caption = "Cada muestra de agua fue procesada por ambos agentes.",
       x = "")

ggsave("plots/UFC-vista-general.png")

# Indicadores fecales según el agente
datos_fecales |> filter(!is.na(UFC)) |> 
  filter(!(Organismo == "E.coli" & UFC > 200)) |> 
  ggplot(aes(Agente, UFC)) +
  geom_boxplot(aes(fill = Agente), show.legend = F, outliers = F) +
  geom_jitter(alpha = .5, width = .2) +
  facet_wrap(~Organismo, scale = "free_y") +
  scale_fill_manual(values = c("#2A788E", "#7AD151")) +
  labs(title = "Indicadores fecales según el agente muestreador",
       subtitle = "Sanidad detecta mayor cantidad de enterococos intestinales.",
  )

ggsave("plots/UFC-agente.png")

# Indicadores fecales según la marea
datos_fecales |> filter(!is.na(UFC)) |> 
  ggplot(aes(Marea, UFC)) +
  geom_boxplot(aes(fill = Marea), show.legend = F, outliers = F) +
  geom_jitter(alpha = .5, width = .2) +
  facet_wrap(~Organismo, scale = "free_y") +
  scale_y_log10() +
  scale_fill_manual(values = c("#DEEBF7", "#9ECAE1", "#4292C6", "#9ECAE1")) +
  labs(title = "Indicadores fecales según la marea",
       subtitle = "Valores similares entre todas las fases mareales.",
       caption = "Eje vertical en escala logarítmica."
  )

ggsave("plots/UFC-mareas.png")
