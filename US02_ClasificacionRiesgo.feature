Feature: Clasificación de riesgo académico
  FUNCIONAL
  Como docente
  Quiero que mis estudiantes estén clasificados por niveles de riesgo
  Para identificar rápidamente quiénes necesitan apoyo académico.


  Scenario: Visualización de estudiantes clasificados por riesgo
    Given que existen estudiantes con diferentes niveles de rendimiento académico
    And cada estudiante tiene asignado un nivel de riesgo
    When el docente accede al dashboard analítico
    Then el sistema debe mostrar a todos los estudiantes clasificados
    And los estudiantes de riesgo alto deben mostrarse en color rojo
    And los estudiantes de riesgo medio deben mostrarse en color amarillo
    And los estudiantes de riesgo bajo deben mostrarse en color verde


  Scenario Outline: Actualización automática de la clasificación de riesgo
    Given que se actualizan las calificaciones de un estudiante
    When el sistema recalcula el <nivel_riesgo>
    Then la clasificación del estudiante debe actualizarse automáticamente.}
    And el <color> asociado al nivel de riesgo debe modificarse según corresponda.


    Examples:
      | nivel_riesgo | color      |
      | "alto"       | "rojo"     |
      | "medio"      | "amarillo" |
      | "bajo"       | "verde"    |
