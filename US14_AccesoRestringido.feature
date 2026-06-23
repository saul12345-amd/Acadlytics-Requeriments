Feature: Acceso restringido a calificaciones
  NO FUNCIONAL  
  Como director, quiero que el 100% de los accesos a las calificaciones estén 
  protegidos mediante roles de usuario, para garantizar la confidencialidad 
  de la información académica.

  Scenario Outline: Escenario 1: Acceso exitoso por un usuario autorizado (Director).
    Given Que existen usuarios en el sistema y el usuario actual tiene el rol de "<rol>".
    When El usuario intenta acceder a la sección de calificaciones.
    Then El sistema permite el ingreso y muestra la información académica solicitada.

    Examples:
      | rol      |
      | Director |

  Scenario Outline: Escenario 4: Acceso denegado a un usuario sin permisos
    Given Que existen usuarios registrados en el sistema.
    When Un "<tipo_usuario>" intenta acceder a las calificaciones.
    Then El sistema bloquea el acceso y garantiza la confidencialidad de la información.

    Examples:
      | tipo_usuario          |
      | usuario sin permisos |