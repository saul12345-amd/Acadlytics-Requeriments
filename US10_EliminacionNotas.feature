Feature: Eliminar de notas
  FUNCIONAL  
  Como docente
  Quiero eliminar notas incorrectas
  Para mantener datos correctos

  Scenario Outline: Escenario 1: Eliminar una nota registrada exitosamente
    Given Given existe una nota registrada con ID "<id_nota>" y valor "<nota>"
    And and el docente tiene permisos para gestionar notas
    When When el docente selecciona la opción "Eliminar"
    And and confirma la eliminación
    Then Then el sistema elimina la nota con ID "<id_nota>"
    And and muestra el mensaje "<mensaje>"

    Examples:
      | id_nota | nota | mensaje                      |
      | 101     | 15   | Nota eliminada correctamente |
      | 102     | 18   | Nota eliminada correctamente |
      | 103     | 12   | Nota eliminada correctamente |

  Scenario Outline: Escenario 2: Cancelar la eliminación de una nota
    Given Given existe una nota registrada con ID "<id_nota>" y valor "<nota>"
    And and el docente tiene permisos para gestionar notas
    When When el docente selecciona la opción "Eliminar"
    And and selecciona cancelar la acción en la ventana de confirmación
    Then Then el sistema mantiene la nota intacta en la base de datos
    And and no altera la información del historial académico

    Examples:
      | id_nota | nota |
      | 101     | 15   |
      | 102     | 18   |

  Scenario Outline: Escenario 3: Intento de eliminación de un registro inexistente (Error de concurrencia)
    Given Given un docente intenta acceder a una nota con ID "<id_nota>"
    When When el registro ya ha sido eliminado por otra sesión o no existe
    Then Then el sistema muestra un mensaje de error indicando: "El registro seleccionado ya no está disponible."
    And And actualiza la vista del historial automáticamente

    Examples:
      | id_nota |
      | 999     |