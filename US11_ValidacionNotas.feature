Feature: Validación de notas
  FUNCIONAL  
  Como docente
  Quiero validar las notas ingresadas
  Para evitar errores

  Scenario Outline: Escenario 1: Validar una nota ingresada inválida (Error por fuera de rango)
    Given Dado que el docente ingresa la nota "<nota>"
    When Cuando la nota es inválida
    Then Entonces el sistema muestra el mensaje de error "<mensaje>"
    And And no permite guardar la nota

    Examples:
      | nota | mensaje                         |
      | -1   | La nota debe estar entre 0 y 20 |
      | 21   | La nota debe estar entre 0 y 20 |
      | 25   | La nota debe estar entre 0 y 20 |

  Scenario Outline: Escenario 2: Validar una nota ingresada válida (Flujo de Éxito)
    Given Dado que el docente ingresa la nota "<nota>"
    When Cuando la nota se encuentra dentro del rango permitido de 0 a 20
    Then Entonces el sistema valida la nota correctamente
    And And habilita la opción de guardar el registro en el historial académico

    Examples:
      | nota |
      | 0    |
      | 11   |
      | 20   |

  Scenario Outline: Escenario 3: Intento de ingreso de caracteres no numéricos (Error de Formato)
    Given Dado que el docente se encuentra en el campo de ingreso de calificaciones
    When Cuando intenta digitar un valor no numérico como "<entrada_invalida>"
    Then Entonces el sistema bloquea la entrada del texto o muestra el mensaje de error "<mensaje>"
    And And no altera el valor previamente registrado

    Examples:
      | entrada_invalida | mensaje                           |
      | "A"              | "Formato incorrecto: ingrese solo números" |
      | "2,0"            | "Formato incorrecto: ingrese solo números" |