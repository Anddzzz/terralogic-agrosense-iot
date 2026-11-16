Feature: Almacenamiento seguro de contraseñas
  Como usuario quiero que mi contraseña se almacene de forma segura y no pueda recuperarse en texto legible para proteger el acceso a mi cuenta

  Scenario: El usuario registra una contraseña
    Given que un usuario se registra en la plataforma
    When el sistema almacena su contraseña
    Then guarda únicamente un hash con sal mediante un algoritmo adaptativo aprobado
    And nunca guarda la contraseña original

  Scenario: El usuario inicia sesión
    Given que un usuario tiene su contraseña almacenada como hash
    When inicia sesión con su contraseña
    Then el sistema la verifica comparándola con el hash almacenado
    And no descifra ni recupera la contraseña original

  Scenario: La contraseña no aparece en registros ni respuestas
    Given que un usuario registra o ingresa su contraseña
    When se revisan los registros, los mensajes de error y las respuestas de la API
    Then la contraseña no aparece en texto legible en ninguno de ellos

  Scenario: Falla el almacenamiento
    Given que falla el proceso de almacenamiento de la contraseña
    When el usuario intenta registrarse
    Then el sistema rechaza la operación y muestra un error genérico
    And no guarda la contraseña en texto plano
