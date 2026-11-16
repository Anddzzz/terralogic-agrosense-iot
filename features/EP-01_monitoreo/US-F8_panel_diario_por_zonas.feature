Feature: Panel diario por zonas
  Como administrador quiero visualizar en una sola pantalla la humedad por zona, la temperatura, la radiación solar y las alertas pendientes, con la posibilidad de filtrar por zona, para supervisar diariamente el estado del biohuerto

  Scenario: Santiago abre el panel con todas las zonas
    Given que el administrador Santiago inició sesión
    And existen las zonas "Zona A" y "Zona B" registradas
    And la "Zona A" tiene humedad 30 %, temperatura 20 °C, radiación 500 W/m² y 2 alertas pendientes
    And la "Zona B" tiene humedad 22 %, temperatura 21 °C, radiación 520 W/m² y 1 alerta pendiente
    When abre el panel diario
    Then el sistema muestra por cada zona sus variables disponibles
    And muestra "2" alertas pendientes en la "Zona A" y "1" en la "Zona B"

  Scenario: Santiago filtra por una zona
    Given que el panel diario está abierto con las zonas "Zona A" y "Zona B"
    When selecciona "Zona A" en el filtro de zona
    Then el sistema muestra únicamente los datos y alertas de la "Zona A"

  Scenario: Una zona no tiene lecturas
    Given que la "Zona C" está registrada y no tiene lecturas
    When Santiago abre el panel diario
    Then el panel muestra "Sin datos" en las variables de la "Zona C"
    And no muestra "0" como si fuera una medición

  Scenario: Una zona no tiene alertas
    Given que la "Zona A" tiene lecturas y no tiene alertas pendientes
    When Santiago abre el panel diario
    Then el panel muestra "Sin alertas pendientes" en la "Zona A"

  Scenario: No hay zonas registradas
    Given que no existe ninguna zona registrada
    When Santiago abre el panel diario
    Then el sistema muestra un estado vacío con un mensaje claro
