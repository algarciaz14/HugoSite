# Hugo Site para Tec-Net S.A.

Este proyecto contiene el código fuente para generar el sitio web de Tec-Net S.A. usando Hugo y un Makefile para gestionar el ciclo de vida del sitio web.

## Prerrequisitos

Antes de comenzar, asegúrese de tener instalados los siguientes programas:

- **Go-Hugo**: Un generador de sitios estáticos.
- **GNU Make**: Una herramienta para la construcción automática de programas y gestión de tareas.

### Instalación de Prerrequisitos

1. **Go-Hugo**:
   - Descargue e instale Hugo desde [su sitio oficial](https://gohugo.io/getting-started/installing/).

2. **GNU Make**:
   - Para Windows, puede instalarlo usando Chocolatey:
     ```sh
     choco install make
     ```


## Ciclo de vida

El ciclo de vida del desarrollo del sitio web está automatizado mediante un `Makefile`. Los objetivos disponibles son:

- `build`: Genera el sitio web en el directorio `u2_tarea0/dist`.
- `clean`: Limpia el contenido del directorio `u2_tarea0/dist`.
- `post`: Crea una nueva entrada de blog. Usa las variables de entorno `POST_NAME` y `POST_TITLE` para especificar el nombre del archivo y el título del post.
- `help`: Muestra esta ayuda.

## Uso

### Generar el sitio web

Para generar el sitio web, ejecuta:

```bash
make build