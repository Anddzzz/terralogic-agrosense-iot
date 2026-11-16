Feature: Recomendación del momento de riego
  Como administrador quiero consultar el día y la hora recomendados para regar cada cultivo para coordinar al personal y ejecutar el riego en un momento adecuado

  Scenario: Santiago consulta el momento recomendado
    Given que el cultivo "Lechuga" de la "Zona A" tiene sus parámetros agronómicos configurados
    And existen lecturas válidas recientes de la "Zona A"
    When Santiago abre "Recomendaciones de riego"
    Then el sistema muestra el día y la hora recomendados para regar "Lechuga"

  Scenario: La recomendación explica su sustento
    Given que existe una recomendación de riego para "Lechuga" en la "Zona A"
    When Santiago consulta la recomendación
    Then el sistema muestra el cultivo "Lechuga" y la zona "Zona A"
    And muestra una breve explicación de los datos o reglas en que se basa

  Scenario: Faltan parámetros del cultivo
    Given que el cultivo "Lechuga" no tiene parámetros agronómicos configurados
    When Santiago abre "Recomendaciones de riego"
    Then el sistema indica "Faltan parámetros del cultivo"
    And no muestra ninguna hora de riego

  Scenario: Las lecturas están desactualizadas
    Given que la última lectura de la "Zona A" tiene más de 30 minutos de antigüedad
    When Santiago abre "Recomendaciones de riego"
    Then el sistema indica "Las lecturas están desactualizadas"
    And no muestra ninguna hora de riego
