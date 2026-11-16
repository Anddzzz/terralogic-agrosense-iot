Feature: Alerta por humedad crítica
  Como agricultor quiero recibir una notificación cuando la humedad del suelo de una zona sea menor que 25 % para realizar el riego oportunamente y reducir el riesgo de estrés hídrico

  Scenario: La humedad baja del umbral
    Given que el sensor de la "Zona A" transmite una lectura válida de humedad de 22 % a las 08:00
    When el sistema procesa la lectura
    Then genera y envía una notificación en menos de 1 minuto
    And la notificación indica la zona "Zona A", el valor "22", la unidad "%" y la hora "08:00"

  Scenario: La humedad es exactamente 25 %
    Given que el sensor de la "Zona A" transmite una lectura válida de humedad de 25 %
    When el sistema procesa la lectura
    Then no genera ninguna notificación de humedad crítica

  Scenario: No se repite la notificación de una misma incidencia
    Given que ya se envió una alerta por humedad de 22 % en la "Zona A"
    When el sensor transmite una nueva lectura válida de 21 %
    Then el sistema no envía otra notificación por esa misma incidencia

  Scenario: Nueva alerta tras recuperarse la humedad
    Given que ya se envió una alerta por humedad de 22 % en la "Zona A"
    And el sensor transmite una lectura válida de 26 %
    When el sensor transmite una lectura válida de 23 %
    Then el sistema envía una nueva notificación de humedad crítica

  Scenario: Lectura ausente o inválida
    Given que el sensor de la "Zona A" transmite una lectura inválida o sin marca de tiempo confiable
    When el sistema procesa la lectura
    Then no genera ninguna notificación

  Scenario: Lectura almacenada sin conexión
    Given que el sensor guardó sin conexión una lectura de humedad de 20 % tomada a las 06:15
    When la lectura se sincroniza a las 07:00
    Then el sistema evalúa la lectura al sincronizarla
    And la notificación conserva la hora original de medición "06:15"
