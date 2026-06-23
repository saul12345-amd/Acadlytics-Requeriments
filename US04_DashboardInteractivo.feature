Feature: Dashboard interactivo del estudiante
  FUNCIONAL  
  Como estudiante, 
  quiero contar con un dashboard visual e interactivo, 
  para comprender mejor mi rendimiento académico.

  Scenario Outline: Visualización del dashboard del estudiante
    Given que el estudiante <usuario> ha iniciado sesión en el sistema
    And su <estado_sesion> de autenticación se encuentra validada
    And cuenta con información académica registrada en el <periodo>
    When el estudiante accede a su dashboard personal desde una <dispositivo>
    Then el sistema debe mostrar una <tipo_interfaz> con su rendimiento académico
    And debe presentar el rendimiento académico del estudiante de forma clara

    Examples:
      | usuario | estado_sesion | periodo  | dispositivo   | tipo_interfaz         |
      | "A001"  | "iniciada"    | "2026-I" | "computadora" | "visual e interactiva"|

  Scenario Outline: Consulta de indicadores académicos
    Given que el estudiante se encuentra en su dashboard personal
    And el estado de actualización de los datos es <estado_informacion>
    When revisa la información disponible en la plataforma
    Then el sistema debe mostrar indicadores de rendimiento académico como el <indicador>
    And debe presentar elementos visuales que faciliten la comprensión de la información mediante un <tipo_visualizacion>

    Examples:
      | estado_informacion | indicador          | tipo_visualizacion |
      | "actualizada"      | "promedio general" | "gráfico de barras"|