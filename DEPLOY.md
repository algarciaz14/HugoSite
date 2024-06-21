# Guía de Despliegue de Awesome Website

Esta guía proporciona información sobre cómo desplegar y gestionar la aplicación Awesome Website en los servidores de producción.

## Contenido del Archivo

El archivo `awesome-website.zip` contiene:

- `awesome-api`: El binario principal de la aplicación.
- `dist/`: El directorio que contiene los recursos y archivos estáticos del sitio web.

## Procedimiento de Despliegue

1. **Desarchivar el Archivo**

   Para descomprimir `awesome-website.zip`:

   ```bash
   unzip awesome-website.zip

Para iniciar la aplicación:
./awesome-api start

Para detener la aplicación:
./awesome-api stop