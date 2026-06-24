Feature: Alertas de bajo rendimiento académico
  FUNCIONAL  
  Como docente, 
  quiero visualizar alertas de estudiantes con bajo rendimiento académico 
  para identificar casos que requieren apoyo.

  Scenario Outline: Escenario 1: Activación de alertas según el promedio académico (Escenario Principal)
    Given GIVEN que el docente visualiza la lista de estudiantes del curso <curso>
    When WHEN el sistema calcula el promedio actual de <estudiante>, que es de <promedio> puntos
    Then THEN el sistema determina el estado de rendimiento como <estado>
    And Y muestra una alerta visual de color <color_alerta> al docente

    Examples:
      | curso                | estudiante   | promedio | estado         | color_alerta |
      | "Matemática" | "Juan Pérez" | 10.5     | "Riesgo Alto"  | "rojo"       |
      | "Matemática" | "Ana Gómez"  | 12.5     | "Riesgo Medio" | "amarillo"   |

  Scenario Outline: Escenario 2: Estudiante con rendimiento óptimo sin alertas (Escenario Alternativo)
    Given GIVEN que el docente visualiza la lista de estudiantes del curso <curso>
    When WHEN el sistema calcula el promedio actual de <estudiante>, que es de <promedio> puntos
    Then THEN el sistema determina el estado de rendimiento como <estado>
    And Y no debe mostrar ninguna alerta de riesgo ni colores de advertencia al docente

    Examples:
      | curso                | estudiante     | promedio | estado         |
      | "Matemática" | "Carlos Ruiz"  | 17.5     | "Riesgo Bajo"  |
      | "Matemática" | "María Torres" | 20.0     | "Riesgo Bajo"  |

  Scenario Outline: Escenario 3: Cambio dinámico de alerta tras actualización de nota (Escenario de Recálculo)
    Given GIVEN que el docente visualiza la lista de estudiantes del curso <curso>
    And el estudiante <estudiante> inicialmente tenía una alerta de color "rojo" con promedio <promedio_antiguo>
    When WHEN el docente registra una nueva calificación aprobatoria alta
    Then THEN el sistema calcula el nuevo promedio actual a <promedio_nuevo> puntos
    And Y actualiza automáticamente la alerta visual al color <color_alerta_nueva>

    Examples:
      | curso                | estudiante   | promedio_antiguo | promedio_nuevo | color_alerta_nueva |
      | "Matemática" | "Juan Pérez" | 10.5             | 14.2           | "verde"            |

  Scenario: Escenario 4: Consulta de lista sin estudiantes registrados (Escenario Excepcional)
    Given GIVEN que el docente visualiza la lista de estudiantes de un curso nuevo
    When WHEN el sistema verifica el historial académico y encuentra cero registros de notas
    Then THEN el sistema no debe generar ninguna alerta visual en el dashboard
    And Y muestra un mensaje indicando: "No hay datos de rendimiento disponibles para este curso."
