---
title: Citometría de flujo
subtitle: Concentración de microorganismos en el agua
---


::: {.cell}

:::



::: {.cell}

:::



::: {.cell}

:::




::: {.cell}

:::


## Vista general

Monitoreamos 6 grupos de microorgansismos en base a 3 criterios funcionales:

- ***Synechococcus*** y ***Prochlorococcus***: son dos géneros de cianobacterias (anteriormente conocidas como algas verde-azuladas) identificadas en función de su pigmentación.
- **Nanoeucariotas** y **picoeucariotas**: organismos diversos del dominio eucariota (células con núcleo verdadero) diferenciados en función de su tamaño, siendo *nano* más ancho que *pico*.
- Bacterias de **alto ácido nucleico (HNA)** y **bajo ácido nucleico (LNA)**: según el contenido de ácido nucleico en las células. En líneas generales, las bacterias HNA tienen un ritmo metabólico más acelerado que las LNA y son más adaptadas a entornos cambiantes. El ratio **HNA/LNA** se utiliza como indicador de alteraciones en el medio [@claveau2024].


::: {.cell}
::: {.cell-output-display}
![](citometria_files/figure-html/fig-distribucion-1.png){#fig-distribucion width=672}
:::
:::


Observamos que la mayor variabilidad existe en función del contenido de ácido nucleico (@fig-distribucion), seguido del grupo de *Prochlorococcus*. En las visualizaciones posteriores separaremos HNA y LNA del resto para una mejor resolución de las observaciones.

## Efecto de la marea


::: {.cell}
::: {.cell-output-display}
![](citometria_files/figure-html/fig-marea-bajos-1.png){#fig-marea-bajos width=672}
:::
:::



::: {.cell}
::: {.cell-output-display}
![](citometria_files/figure-html/fig-marea-altos-1.png){#fig-marea-altos width=672}
:::
:::



::: {.cell}
::: {.cell-output-display}
![](citometria_files/figure-html/fig-marea-ratio-1.png){#fig-marea-ratio width=672}
:::
:::


El análisis de la varianza (ANOVA) es un método de inferencia estadística que nos permite señalar como de importante son las diferencias entre las distribuciones de un parámetro para cada grupo [@mcdonald2014].

En la @fig-f-ratio-marea se especula como de inusuales sería nuestros resultados de HNA/LNA según la fase de la marea si esta no tuvieran ningún efecto sobre HNA/LNA. Habría menos de un 2% de probabilidades de obtener los resultados registrados. Por lo tanto, **es probable que existan factores no aleatorios que afecten la variabilidad del ratio HNA/LNA con la marea**. Seria interesante investigar en mayor profundidad estos posibles efectos, ya que el tamaño del monitoreo es pequeño y desigual entre fases de la marea.


::: {.cell}
::: {.cell-output-display}
![](citometria_files/figure-html/fig-f-ratio-marea-1.png){#fig-f-ratio-marea width=672}
:::
:::


## Variación geográfica


::: {.cell}
::: {.cell-output-display}
![](citometria_files/figure-html/fig-lugar-1.png){#fig-lugar width=672}
:::
:::



::: {.cell}
::: {.cell-output-display}
![](citometria_files/figure-html/fig-lugar-ratio-1.png){#fig-lugar-ratio width=672}
:::
:::


En la @fig-t-ratio-lugar se demuestra mediante la prueba de la *t* de *Student* como la media de HNA/LNA en El Confital **es significativamente superior** a la área de descarga del barranco Guiniguada.


::: {.cell}
::: {.cell-output-display}
![](citometria_files/figure-html/fig-t-ratio-lugar-1.png){#fig-t-ratio-lugar width=672}
:::
:::


## Evolución temporal


::: {.cell}
::: {.cell-output-display}
![](citometria_files/figure-html/fig-mes-1.png){#fig-mes width=672}
:::
:::



::: {.cell}
::: {.cell-output-display}
![](citometria_files/figure-html/fig-mes-ratio-1.png){#fig-mes-ratio width=672}
:::
:::


