Feature: Historial de variables de 30 días
  Como administrador quiero consultar el historial de las variables registradas durante los últimos 30 días por parcela o zona para revisar la evolución de las condiciones del cultivo

  Scenario: Santiago consulta los últimos 30 días
    Given que el administrador Santiago inició sesión
    And existen lecturas históricas de la "Zona A"
    When selecciona el periodo de los últimos 30 días
    Then el sistema presenta los registros diarios de humedad, temperatura y radiación solar
    And cada registro se identifica por su fecha y su unidad

  Scenario: Hay días sin mediciones
    Given que la "Zona A" no tiene mediciones el 25/10/2026 ni el 26/10/2026
    When Santiago consulta los últimos 30 días
    Then el sistema identifica ese intervalo como "Sin datos"
    And no interpola valores como si fueran mediciones reales

  Scenario: No hay registros en el periodo
    Given que la "Zona A" no tiene ningún registro en los últimos 30 días
    When Santiago consulta los últimos 30 días
    Then el sistema muestra un estado vacío con el mensaje "No hay registros en el periodo seleccionado"
