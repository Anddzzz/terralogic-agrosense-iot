Feature: Interfaz web responsiva
  Como usuario de AgroSense IoT quiero acceder a la plataforma desde el navegador de un celular Android o de una computadora para consultar las funciones correspondientes a mi perfil desde distintos dispositivos

  Scenario: Eydi abre la plataforma desde su celular Android
    Given que Eydi abre la URL de la plataforma en Chrome de Android con un ancho de pantalla de 360 px
    When la plataforma termina de cargar
    Then la interfaz se adapta al ancho de la pantalla
    And todos los controles se pueden usar sin desplazamiento horizontal

  Scenario: Santiago abre la plataforma desde una computadora
    Given que Santiago abre la URL de la plataforma en Chrome con una resolución de 1920 x 1080
    When la plataforma termina de cargar
    Then la interfaz aprovecha el espacio disponible
    And los datos, tablas y gráficos se mantienen legibles

  Scenario: El navegador no es compatible con una función
    Given que un usuario abre la plataforma en un navegador que no está en la lista de navegadores soportados
    When intenta usar una función que ese navegador no admite
    Then el sistema informa la limitación de esa función
    And el resto de la plataforma sigue disponible
