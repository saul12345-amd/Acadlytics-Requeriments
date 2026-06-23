Feature: Reporte de cursos críticos
  FUNCIONAL  
  Como director, 
  quiero ver reportes automáticos de cursos con bajo rendimiento académico, 
  para tomar decisiones oportunas de mejora educativa.

  Scenario Outline: Escenario 1: Resaltado automático de cursos con promedio desaprobatorio (Escenario Principal)
    Given Dado que existen cursos con promedios registrados en el sistema
    When Cuando el sistema analiza el rendimiento académico de la materia <curso> con promedio <promedio>
    Then Entonces se resaltan en rojo los cursos con promedio desaprobatorio
    And se le asigna el estado de alerta <alerta>

    Examples:
      | curso                | promedio | alerta     |
      | "Matemática"         | 10.2     | "Crítico"  |
      | "Física"             | 09.5     | "Crítico"  |
      | "Diseño de Software" | 10.8     | "Crítico"  |

  Scenario Outline: Escenario 2: Evaluación de cursos con rendimiento aprobatorio (Escenario Alternativo)
    Given Dado que existen cursos con promedios registrados en el sistema
    When Cuando el sistema analiza el rendimiento académico de la materia <curso> con promedio <promedio>
    Then Entonces no se resaltan en rojo los cursos ya que mantienen un promedio aprobatorio
    And se visualizan en el reporte con un estado <alerta>

    Examples:
      | curso                | promedio | alerta     |
      | "Programación"       | 15.4     | "Óptimo"   |
      | "Química"            | 13.0     | "Regular"  |

  Scenario: Escenario 3: Exportación del reporte automático de cursos críticos (Funcionalidad de Gestión)
    Given Dado que el director visualiza el reporte analítico de cursos críticos en pantalla
    When Cuando selecciona la opción de "Exportar Reporte" en formato PDF
    Then Entonces el sistema genera un documento con el listado detallado de las materias resaltadas en rojo
    And descarga el archivo de manera exitosa en el almacenamiento local