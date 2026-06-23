Feature: Disponibilidad del dashboard analítico
  NO FUNCIONAL
  Como docente, quiero poder acceder al dashboard analítico en cualquier momento, 
  para consultar la información académica de mis estudiantes cuando lo necesite.

  Scenario Outline: Acceso exitoso al dashboard analítico
    Given que el docente cuenta con una <estado_cuenta> activa y permisos de acceso
    And el sistema está <estado_sistema> correctamente
    When el docente inicia sesión en la plataforma
    And selecciona la opción <opcion_dashboard>
    Then el sistema muestra el dashboard de forma <resultado_acceso>
    And el servicio mantiene una disponibilidad mínima del <disponibilidad>

    Examples:
      | estado_cuenta | estado_sistema | opcion_dashboard     | resultado_acceso                  | disponibilidad |
      | "cuenta"      | "funcionando"  | "Dashboard Analítico"| "inmediata y sin interrupciones" | "99.5%"        |

  Scenario Outline: Acceso al dashboard fuera del horario laboral
    Given que el docente dispone de <credenciales> válidas
    When el docente accede al dashboard en cualquier momento del día
    Then el sistema permite el acceso sin restricciones de horario

    Examples:
      | credenciales |
      | "válidas"    |