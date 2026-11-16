Feature: Captura offline y sincronización
  Como agricultor quiero que el dispositivo sensor conserve las lecturas cuando se interrumpa internet y las sincronice al recuperar la conexión para evitar perder el historial de mis parcelas

  Scenario: El sensor guarda una medición sin conexión
    Given que el sensor de la parcela "Pomacocha" no tiene conexión a internet
    When registra una nueva medición de humedad de 27 % a las 09:00
    Then la guarda localmente
    And la medición tiene un identificador único, el valor "27", la unidad "%" y la marca de tiempo "09:00"

  Scenario: Se restablece la conexión
    Given que el sensor tiene 3 lecturas pendientes guardadas sin conexión
    When se restablece la conexión a internet
    Then el sensor envía las 3 lecturas pendientes
    And la nube las incorpora conservando su fecha y hora originales

  Scenario: Un reintento no genera duplicados
    Given que una lectura con identificador "L-001" ya fue sincronizada
    When el sensor la envía de nuevo con el mismo identificador
    Then la nube no crea una segunda lectura

  Scenario: Falla la sincronización
    Given que el sensor tiene una lectura pendiente
    When falla el intento de sincronización
    Then la lectura permanece en la cola para un nuevo intento

  Scenario: El almacenamiento local está lleno
    Given que el almacenamiento local contiene 1000 lecturas pendientes
    When el sensor intenta guardar una nueva lectura
    Then no sobrescribe ninguna lectura pendiente
    And registra el error de almacenamiento lleno
