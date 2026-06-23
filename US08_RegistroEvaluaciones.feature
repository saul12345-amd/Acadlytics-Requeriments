Feature: Registro de notas de evaluaciones
  FUNCIONAL  
  Como docente, 
  quiero registrar las notas de prácticas y exámenes mediante un menú intuitivo 
  para facilitar la digitalización de evaluaciones y mantener actualizado el historial académico.

  Scenario Outline: Escenario 1: Registro exitoso de notas mediante el menú intuitivo (Escenario Principal)
    Given dado que el docente ingresa al módulo de evaluaciones
    And selecciona la sección correspondiente al curso <Curso>
    When cuando registra una nota de un estudiante con el valor <Nota_valor> para la evaluación <Evaluacion>
    Then entonces el sistema debe guardar la información en el historial académico
    And muestra el mensaje de confirmación <mensaje>

    Examples:
      | Curso                | Evaluacion   | Nota_valor | mensaje                        |
      | "Diseño de Software" | "Práctica 1" | 16         | "Nota guardada correctamente"  |
      | "Diseño de Software" | "Examen"     | 14         | "Nota guardada correctamente"  |

  Scenario Outline: Escenario 2: Intento de registro con datos inválidos o vacíos (Escenario Alternativo / Validación)
    Given dado que el docente ingresa al módulo de evaluaciones
    And se encuentra en el formulario de carga para el curso <Curso>
    When cuando registra una nota de un estudiante con un valor inválido de <Nota_valor>
    Then entonces el sistema no debe guardar la información en el historial académico
    And muestra un mensaje de alerta indicando: "La nota ingresada no es válida. Debe estar en el rango de 0 a 20."

    Examples:
      | Curso                | Nota_valor |
      | "Diseño de Software" | 25         |
      | "Diseño de Software" | -2         |

  Scenario: Escenario 3: Cancelación del proceso de registro de notas (Escenario de Cancelación)
    Given dado que el docente ingresa al módulo de evaluaciones
    And digita la nota de un estudiante en el formulario de evaluaciones
    When cuando el docente selecciona la opción "Cancelar" o regresa al menú principal sin guardar
    Then entonces el sistema debe descartar los cambios realizados
    And no altera ni modifica la información existente en el historial académico

  Scenario Outline: Escenario 4: Reintento automático de guardado ante microcortes de red (Escenario de Resiliencia)
    Given dado que el docente ingresa al módulo de evaluaciones
    When cuando registra una nota de un estudiante con el valor <Nota_valor> e intenta guardar durante una inestabilidad de red
    Then entonces el sistema reintenta la sincronización en segundo plano de manera automática
    And confirma el almacenamiento exitoso en el historial académico una vez restablecida la conexión

    Examples:
      | Nota_valor |
      | 15         |