Feature: Ocultamiento del campo de contraseña
  Como usuario quiero que la contraseña se muestre oculta mientras la escribo en el formulario de acceso o registro para evitar que otras personas puedan verla en pantalla

  Scenario: El usuario escribe su contraseña
    Given que Eydi está en el campo de contraseña del formulario de acceso
    When escribe caracteres
    Then el sistema los representa con puntos o asteriscos
    And no los muestra como texto legible

  Scenario: El usuario sale del campo o vuelve a la pantalla
    Given que Eydi escribió su contraseña en el formulario
    When abandona el campo o vuelve a la pantalla
    Then la contraseña no queda expuesta visualmente

  Scenario: El usuario no ingresa contraseña
    Given que Eydi dejó vacío el campo de contraseña
    When intenta enviar el formulario
    Then el formulario le solicita completar la contraseña
    And no revela credenciales ni datos de otros campos
