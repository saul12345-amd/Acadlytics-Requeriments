Feature: Adaptación responsiva multiplataforma.
  NO FUNCIONAL  
  Como estudiante, quiero que la plataforma sea completamente responsiva en cualquier 
  dispositivo móvil, para poder navegar de manera cómoda y clara.

  Scenario Outline: Escenario 1: Adaptación a pantalla vertical (Smartphone pequeño).
    Given Que el estudiante accede al sistema desde un <dispositivo> estándar en orientación <orientacion>.
    When Abre la plataforma y visualiza el <vista>
    Then La interfaz se adapta automáticamente, <comportamiento> para evitar el desplazamiento horizontal.

    Examples:
      | dispositivo  | orientacion | vista                 | comportamiento                              |
      | "smartphone" | "vertical"  | "dashboard principal" | "apilando los elementos y menús"            |

  Scenario Outline: Escenario 2: Adaptación a pantalla ancha (Tablet).
    Given Que el estudiante accede a la plataforma desde una <dispositivo>.
    When Abre la plataforma para consultar su rendimiento.
    Then La interfaz aprovecha el espacio extendido, <comportamiento> para una visualización cómoda.

    Examples:
      | dispositivo | comportamiento                                                 |
      | "tablet"    | "ajustando los gráficos y tablas automáticamente"               |

  Scenario Outline: Escenario 3: Rotación dinámica del dispositivo.
    Given Que el estudiante está consultando sus notas en un <dispositivo> en modo <orientacion_inicial>.
    When Rota físicamente el dispositivo hacia el modo <orientacion_final>.
    Then La interfaz detecta el cambio y reorganiza los gráficos y el menú automáticamente a las nuevas proporciones de la pantalla.

    Examples:
      | dispositivo        | orientacion_inicial | orientacion_final |
      | "dispositivo móvil"| "vertical"          | "horizontal"      |