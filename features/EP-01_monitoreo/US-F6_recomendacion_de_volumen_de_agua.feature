Feature: Recomendación de volumen de agua
  Como administrador quiero consultar el volumen de agua recomendado para cada cultivo para orientar al personal y evitar aplicar una cantidad inadecuada

  Scenario: Santiago consulta el volumen recomendado
    Given que la "Zona A" tiene configurados el cultivo "Lechuga", el área de riego de 50 m² y los parámetros agronómicos
    When Santiago consulta las recomendaciones
    Then el sistema muestra el volumen recomendado "250 L"
    And muestra el cultivo "Lechuga" y la zona "Zona A"

  Scenario: El volumen muestra los parámetros usados
    Given que existe un volumen recomendado para la "Zona A"
    When Santiago consulta la recomendación
    Then el sistema muestra el tipo de cultivo, el área de riego y los parámetros principales del cálculo

  Scenario: Falta un dato requerido
    Given que la "Zona A" no tiene configurada el área de riego
    When Santiago consulta las recomendaciones
    Then el sistema no muestra ningún volumen numérico
    And solicita completar la información faltante
