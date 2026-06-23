Feature: Progreso mensual académico
  NO FUNCIONAL  
  Como estudiante, 
  quiero ver mi avance mes a mes mediante un gráfico de barras interactivo por curso, 
  para comprender mi progreso de forma rápida y sencilla.

  Scenario Outline: Escenario 1: Visualización exitosa del gráfico de barras con el progreso mensual (Escenario Principal)
    Given dado que el estudiante inició sesión en la plataforma
    And está inscrito en el curso <Curso>
    When cuando accede a la sección de Progreso Académico
    And selecciona el mes <Mes>
    Then entonces el sistema genera un gráfico de barras interactivo
    And el gráfico debe mostrar un promedio mensual de <Promedio> puntos

    Examples:
      | Curso          | Mes     | Promedio |
      | "Matemática"   | "Abril" | 14.5     |
      | "Programación" | "Mayo"  | 17.9     |
      | "Física"       | "Junio" | 11.2     |

  Scenario Outline: Escenario 2: Intento de visualización en un mes sin calificaciones registradas (Escenario Alternativo)
    Given dado que el estudiante inició sesión en la plataforma
    And está inscrito en el curso <Curso>
    When cuando accede a la sección de Progreso Académico
    And selecciona un mes donde no tiene notas evaluadas
    Then entonces el sistema no carga el gráfico de barras
    And muestra un mensaje indicando: "No se registran actividades académicas ni calificaciones para el mes seleccionado."

    Examples:
      | Curso          |
      | "Matemática"   |
      | "Programación" |
      | "Física"       |

  Scenario: Escenario 3: Fallo en la carga del gráfico por problemas de conectividad (Escenario de Error)
    Given dado que el estudiante inició sesión en la plataforma
    When cuando accede a la sección de Progreso Académico
    And el servidor experimenta un retraso o pérdida de conexión
    Then entonces el sistema muestra un indicador de carga interrumpida
    And despliega un mensaje de alerta: "Error al cargar el gráfico interactivo. Por favor, intente de nuevo."