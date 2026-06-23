Feature: Historial de rendimiento académico
  FUNCIONAL
  Como docente
  Quiero visualizar el rendimiento por curso y periodo histórico
  Para realizar asesorías personalizadas.

  Scenario Outline: Consulta del historial académico de un estudiante
    Given que el usuario tiene el <rol> registrado
    And existen registros históricos de rendimiento académico
    When el docente selecciona un estudiante
    Then el sistema debe mostrar el rendimiento por <curso>
    And el sistema debe mostrar el rendimiento por <periodo> académico

    Examples:
      | rol       | curso          | periodo   |
      | "docente" | "Matemática"   | "2025-I"  |
      | "docente" | "Física"       | "2025-II" |
      | "docente" | "Programación" | "2026-I"  |

  Scenario Outline: Búsqueda de estudiantes para consultar su historial
    Given que el docente se encuentra en la sección de historial académico
    When el docente ingresa el <criterio_busqueda> de un estudiante
    Then el sistema debe mostrar los estudiantes que coincidan con la búsqueda
    And el docente debe poder seleccionar un estudiante para visualizar su historial

    Examples:
      | criterio_busqueda |
      | "código"          |
      | "nombre"          |