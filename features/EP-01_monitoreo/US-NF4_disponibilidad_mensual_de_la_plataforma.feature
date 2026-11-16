Feature: Disponibilidad mensual de la plataforma
  Como administrador quiero que la plataforma mantenga una disponibilidad mensual mínima del 99 % para poder consultar la información cuando necesite gestionar el riego

  Scenario: La disponibilidad cumple el objetivo
    Given un mes de 30 días con 43200 minutos totales
    And 200 minutos de indisponibilidad registrados
    When se calcula la disponibilidad mensual
    Then el resultado es "99,54 %"
    And el objetivo del 99 % se considera cumplido

  Scenario: La disponibilidad no cumple el objetivo
    Given un mes de 30 días con 43200 minutos totales
    And 600 minutos de indisponibilidad registrados
    When se calcula la disponibilidad mensual
    Then el resultado es "98,61 %"
    And el objetivo del 99 % se considera incumplido

  Scenario: Santiago obtiene el reporte mensual
    Given que hay incidentes de indisponibilidad registrados durante el mes
    When Santiago solicita el reporte mensual
    Then el sistema muestra los minutos disponibles, los minutos indisponibles y el porcentaje final

  Scenario: Se registra un incidente
    Given que la comprobación de salud detecta que un servicio central no responde a las 10:00
    When el servicio vuelve a responder a las 10:12
    Then el sistema registra un incidente con inicio 10:00, fin 10:12 y duración 12 minutos

  Scenario: Mantenimiento programado
    Given que no existe una política de SLA aprobada que excluya el mantenimiento
    And hubo 30 minutos de mantenimiento programado en el mes
    When se calcula la disponibilidad mensual
    Then esos 30 minutos se incluyen como indisponibilidad en el cálculo
