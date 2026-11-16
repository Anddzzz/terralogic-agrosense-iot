Feature: Comparación de promedios de humedad
  Como administrador quiero comparar el promedio de humedad del suelo de los últimos 30 días con el de los 30 días inmediatamente anteriores para identificar variaciones en las condiciones de riego

  Scenario: Santiago compara dos periodos con datos suficientes
    Given que el administrador Santiago inició sesión
    And la "Zona A" tiene datos suficientes del 17/09/2026 al 16/10/2026 con promedio de humedad 27,2 %
    And tiene datos suficientes del 17/10/2026 al 15/11/2026 con promedio de humedad 31,5 %
    When solicita la comparación
    Then el sistema muestra los promedios "27,2 %" y "31,5 %"
    And muestra la variación "+4,3 puntos porcentuales"
    And indica las fechas de los dos periodos comparados

  Scenario: Comparación para una zona seleccionada
    Given que Santiago selecciona la "Zona A" en el filtro
    When solicita la comparación
    Then el sistema calcula ambos periodos solo con datos de la "Zona A"
    And aplica el mismo filtro a los dos periodos

  Scenario: Un periodo no tiene datos suficientes
    Given que la "Zona A" no tiene datos suficientes del 17/09/2026 al 16/10/2026
    When Santiago solicita la comparación
    Then el sistema informa "La comparación no está disponible"
    And no genera promedios ficticios
    And no incluye el consumo real de agua
