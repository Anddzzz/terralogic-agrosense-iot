Feature: Consulta de variables por parcela
  Como agricultor quiero consultar desde mi celular la humedad del suelo, la temperatura y la radiación solar de cada parcela para conocer las condiciones de mis cultivos sin tener que recorrerlas continuamente

  Scenario: Eydi ve la última lectura válida de su parcela
    Given que la agricultora Eydi inició sesión desde su celular
    And tiene asociada la parcela "Pomacocha"
    And la última lectura válida es humedad 28 %, temperatura 12 °C y radiación 540 W/m² de hace 10 minutos
    When abre el detalle de la parcela "Pomacocha"
    Then el sistema muestra humedad "28 %", temperatura "12 °C" y radiación solar "540 W/m²"
    And muestra la fecha y hora de la medición
    And no muestra la etiqueta "Desactualizada"

  Scenario: La última lectura no es reciente
    Given que la última lectura válida de la parcela "Pomacocha" tiene 45 minutos de antigüedad
    When Eydi abre el detalle de la parcela "Pomacocha"
    Then el sistema muestra esa lectura con sus unidades y su fecha y hora de medición
    And la identifica con la etiqueta "Desactualizada"

  Scenario: La parcela no tiene ninguna lectura válida
    Given que la parcela "Pomacocha" no tiene ninguna lectura válida
    When Eydi abre el detalle de la parcela "Pomacocha"
    Then el sistema muestra el mensaje "Sin lectura disponible"
    And no muestra el valor "0" ni otro valor numérico en ninguna variable
