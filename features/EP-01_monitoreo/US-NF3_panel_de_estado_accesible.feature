Feature: Panel de estado accesible
  Como agricultor con poca experiencia tecnológica quiero que el estado del cultivo se presente mediante tres colores, cada uno acompañado de un ícono y un texto descriptivo, para comprender la condición de mis cultivos sin ayuda

  Scenario: El cultivo está en estado verde
    Given que la "Zona A" tiene una lectura válida de humedad de 30 %
    And las reglas de clasificación están configuradas
    When el sistema evalúa el cultivo de la "Zona A"
    Then muestra el estado "verde"

  Scenario: El cultivo está en estado rojo
    Given que la "Zona A" tiene una lectura válida de humedad de 22 %
    When el sistema evalúa el cultivo de la "Zona A"
    Then muestra el estado "rojo"

  Scenario: El cultivo está en estado amarillo
    Given que la "Zona A" tiene una lectura válida de humedad de 36 %
    When el sistema evalúa el cultivo de la "Zona A"
    Then muestra el estado "amarillo"

  Scenario: Cada estado muestra color, ícono y texto a la vez
    Given que la "Zona A" está en estado "verde"
    When Eydi ve el panel diario y el detalle de la parcela
    Then en ambas pantallas el estado se muestra con color verde, un ícono y el texto "Óptimo"
    And el significado se entiende aunque no se distinga el color

  Scenario: Faltan lecturas o son inválidas
    Given que la "Zona A" no tiene lecturas válidas
    When el sistema evalúa el cultivo de la "Zona A"
    Then muestra la condición "Sin datos"
    And no clasifica el cultivo como verde, amarillo ni rojo
