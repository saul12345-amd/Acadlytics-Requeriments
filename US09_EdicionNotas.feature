Feature: EDITAR NOTAS DE ESTUDIANTES
  FUNCIONAL  
  Como docente
  Quiero editar una nota registrada
  Para corregir errores que pueda haber cometido

  Scenario Outline: Editar una nota registrada exitosamente
    Given Given existe una nota registrada con valor "<nota_actual>"
    And and el docente tiene permisos para editar notas
    When When el docente selecciona la opción "Editar"
    And and modifica la nota por "<nueva_nota>"
    And and guarda los cambios
    Then Then el sistema actualiza la nota con el valor "<nueva_nota>"
    And and muestra el mensaje "<mensaje>"

    Examples:
      | nota_actual | nueva_nota | mensaje                             |
      | 12          | 15         | Nota actualizada correctamente      |
      | 18          | 20         | Nota actualizada correctamente      |
      | 10          | 14         | Nota actualizada correctamente      |

  Scenario Outline: Intentar registrar una nota fuera del rango permitido
    Given Given existe una nota registrada con valor "<nota_actual>"
    When When el docente modifica la nota por "<nueva_nota>"
    And and guarda los cambios
    Then Then el sistema muestra el mensaje "<mensaje>"
    And and no actualiza la nota

    Examples:
      | nota_actual | nueva_nota | mensaje                             |
      | 15          | 21         | La nota debe estar entre 0 y 20     |
      | 12          | -1         | La nota debe estar entre 0 y 20     |