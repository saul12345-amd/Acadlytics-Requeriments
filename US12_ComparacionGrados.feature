Feature: Comparación entre grados y secciones
  FUNCIONAL  
  Como director
  Quiero comparar el rendimiento académico entre diferentes grados y secciones
  Para identificar fortalezas y oportunidades de mejora en la institución

  Scenario Outline: Escenario 1: Comparar el rendimiento académico entre grados y secciones (Escenario Principal)
    Given Given que existen datos académicos registrados para los grados "<grado1>" y "<grado2>"
    And Y que el director tiene acceso al módulo de reportes académicos
    When When el director selecciona los grados o secciones "<grado1>" y "<grado2>"
    And Y solicita la comparación de rendimiento académico
    Then Then el sistema muestra la comparación del rendimiento académico de "<grado1>" y "<grado2>"
    And Y presenta las diferencias y similitudes encontradas

    Examples:
      | grado1 | grado2 |
      | 1° A   | 1° B   |
      | 2° A   | 3° A   |
      | 4° B   | 5° B   |

  Scenario Outline: Escenario 2: Intento de comparación con datos insuficientes (Escenario Alternativo)
    Given Given que el director tiene acceso al módulo de reportes académicos
    When When selecciona los grados o secciones "<grado1>" y "<grado2>" pero uno de ellos no cuenta con notas registradas en el periodo actual
    Then Then el sistema no genera la gráfica comparativa
    And Y muestra un mensaje de advertencia indicando: "No se puede realizar la comparación debido a la falta de registros académicos en las secciones seleccionadas."

    Examples:
      | grado1 | grado2 |
      | 1° A   | 1° B   |