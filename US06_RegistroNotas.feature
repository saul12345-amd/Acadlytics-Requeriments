Feature: Registro de notas
  FUNCIONAL  
  Como docente, 
  quiero registrar las notas de mis estudiantes 
  para mantener actualizada la información académica.

  Scenario Outline: Escenario 1: Registro exitoso de una nota académica por parte del docente (Escenario Principal)
    Given dado que el docente se encuentra en la sección de Registro de Notas
    And seleccionó el curso <Curso>
    When cuando ingresa la nota de <Nota_valor> para el estudiante <Estudiante> en la evaluación <Evaluacion>
    And confirma el guardado del registro
    Then entonces el sistema almacena la calificación de manera correcta
    And muestra el mensaje <mensaje>

    Examples:
      | Curso                | Estudiante   | Evaluacion   | Nota_valor | mensaje                      |
      | "Matemática" | "Juan Pérez" | "Tarea 1"    | 18         | "Nota registrada con éxito"  |
      | "Matemática" | "Ana Gómez"  | "Proyecto 2" | 15         | "Nota registrada con éxito"  |

  Scenario Outline: Escenario 2: Intento de registro con una nota fuera del rango permitido (Escenario Alternativo / Error de Validación)
    Given dado que el docente se encuentra en la sección de Registro de Notas
    And seleccionó el curso <Curso>
    When cuando ingresa una nota inválida de <Nota_valor> para el estudiante <Estudiante> en la evaluación <Evaluacion>
    Then entonces el sistema no permite guardar el registro
    And muestra un mensaje de error indicando: "La nota ingresada debe estar en el rango de 0 a 20."

    Examples:
      | Curso                | Estudiante   | Evaluacion   | Nota_valor |
      | "Matemática" | "Juan Pérez" | "Tarea 1"    | -5         |
      | "Matemática" | "Ana Gómez"  | "Proyecto 2" | 25         |
