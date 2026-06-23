Feature: Optimización del tiempo de carga móvil
  NO FUNCIONAL  
  Como estudiante, quiero acceder a la plataforma desde mi celular con un tiempo de 
  carga rápido, para consultar mi información académica en cualquier momento.

  Scenario Outline: Escenario 1: Carga inicial de la plataforma en móvil (Rendimiento óptimo).
    Given Que el estudiante usa un dispositivo móvil con conexión "<tipo_conexion>" a internet.
    When Ingresa a la plataforma a través de su navegador.
    Then El sistema carga por completo la interfaz principal en menos de <tiempo_limite> segundos.

    Examples:
      | tipo_conexion | tiempo_limite |
      | estable       | 3             |

  Scenario Outline: Escenario 2: Carga de reportes o historial pesado.
    Given Que el estudiante usa un dispositivo móvil y posee un <tipo_historial> académico extenso con datos de años anteriores.
    When Navega hacia la sección de consulta histórica de notas.
    Then El sistema procesa la solicitud y muestra la información en pantalla sin exceder el límite de los <tiempo_limite> segundos de carga.

    Examples:
      | tipo_historial | tiempo_limite |
      | historial      | 3             |