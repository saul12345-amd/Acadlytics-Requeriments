Feature: Visualización gráfica de rendimiento en dispositivos móviles.
  NO FUNCIONAL  
  Como estudiante, quiero acceder a la plataforma desde mi celular con una 
  disponibilidad del 99% del tiempo, para consultar mi rendimiento 
  académico en cualquier momento.

  Scenario Outline: Escenario 1: Visualización exitosa con datos registrados.
    Given Que el estudiante accede a la plataforma desde su <dispositivo> y cuenta con calificaciones registradas en el periodo.
    When Abre la sección de <seccion>.
    Then El sistema procesa la información y muestra gráficos de <tipo_grafico> claros que representan su rendimiento.

    Examples:
      | dispositivo | seccion | tipo_grafico |
      | "móvil"     | "notas" | "barras"     |

  Scenario Outline: Escenario 2: Acceso en periodo de alta concurrencia (Prueba de Disponibilidad).
    Given Que múltiples usuarios están utilizando el sistema simultáneamente durante época de exámenes finales.
    When El estudiante intenta abrir la sección de <seccion> desde su <dispositivo>.
    Then El sistema mantiene su disponibilidad y permite consultar los gráficos de <tipo_grafico> sin interrupciones del servicio.

    Examples:
      | seccion | dispositivo | tipo_grafico |
      | "notas" | "celular"   | "barras"     |

  Scenario Outline: Escenario 3: Consulta sin calificaciones ingresadas (Validación de estado vacío).
    Given Que el estudiante accede desde su <dispositivo> a inicio del periodo académico.
    When Abre la sección de <seccion> antes de que los docentes hayan registrado calificaciones.
    Then El sistema muestra una interfaz <estado> con un mensaje indicando que aún no hay datos para generar el gráfico de <tipo_grafico>.

    Examples:
      | dispositivo | seccion | estado  | tipo_grafico |
      | "móvil"     | "notas" | "vacía" | "barras"     |