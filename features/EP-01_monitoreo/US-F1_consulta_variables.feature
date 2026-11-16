# language: es
@EP-01 @US-F1
Característica: Consulta de variables por parcela
  Como agricultor
  Quiero consultar la humedad, temperatura y radiación solar de cada parcela
  Para conocer mis cultivos sin recorrerlos continuamente

  Antecedentes:
    Dado que el agricultor inició sesión
    Y tiene la parcela "Parcela Norte" asociada

  @CA1 @normal
  Escenario: Ver la última lectura válida
    Dado que la última lectura válida es humedad 28 %, temperatura 19 °C y radiación 540 W/m², registrada hace 10 minutos
    Cuando abre el detalle de "Parcela Norte"
    Entonces el sistema muestra "28 %", "19 °C" y "540 W/m²"
    Y muestra la fecha y hora de la medición
    Y no muestra la etiqueta "Desactualizada"

  @CA2 @alterno
  Escenario: Identificar una lectura desactualizada
    Dado que la última lectura válida tiene 45 minutos de antigüedad
    Cuando abre el detalle de "Parcela Norte"
    Entonces el sistema muestra esa lectura con unidades y fecha/hora
    Y la identifica con la etiqueta "Desactualizada"

  @CA3 @excepcional
  Escenario: Parcela sin lecturas válidas
    Dado que "Parcela Norte" no tiene ninguna lectura válida
    Cuando abre el detalle de "Parcela Norte"
    Entonces el sistema muestra "Sin lectura disponible"
    Y no muestra el valor "0" ni otro número en ninguna variable
