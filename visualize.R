library(tidyverse)

# Semilla para reproducibilidad de los jitter
set.seed("1312")

ufc <- read_rds("data/UFC.rds")
ufc_parej <- read_rds("data/UFC-emparejadas.rds")

# Vista general verano 2025
ufc_parej |> filter(!is.na(UFC)) |> 
  ggplot(aes(Fecha, UFC, fill = Agente)) +
  geom_area(color = "black", position = "dodge", alpha = .6) +
  facet_wrap(~Organismo, nrow = 2, scale = "free_y") +
  scale_x_datetime(date_labels = "%y-%m-%d") +
  scale_fill_manual(values = c("#2A788E", "#7AD151")) +
  labs(title = "Indicadores fecales verano 2025",
       subtitle = "Mayor detección de Enterococos por Sanidad.",
       x = "")

ggsave("plots/UFC-vista-general.png")

# Indicadores fecales según el agente
ufc_parej |> filter(!is.na(UFC)) |> 
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
ufc |> filter(!is.na(UFC)) |> 
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
