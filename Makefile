# Makefile para automatizar tareas en el proyecto Go-Hugo

build: ## Generar el sitio web en el directorio u2_tarea0/dist
	hugo -d u2_tarea0/dist/

clean: ## Limpiar el contenido del directorio u2_tarea0/dist
	powershell -Command "Remove-Item -Recurse -Force u2_tarea0/dist"

post: ## Crear una nueva entrada de blog
	hugo new posts/$(POST_NAME).md
	powershell -Command "(Get-Content 'content/posts/$(POST_NAME).md') -replace 'title:.*', 'title: \"$(POST_TITLE)\"' | Set-Content 'content/posts/$(POST_NAME).md'"

help: ## Mostrar esta ayuda
	@echo "Targets disponibles:"
	@powershell -Command "Get-Content '$(MAKEFILE_LIST)' | Select-String -Pattern '^[a-zA-Z_-]+:.?## ' | ForEach-Object { $$_.Line.Trim() -replace '^.## ', ' - ' '}"

package: build ## Empaquetar la aplicación en un archivo ZIP
	@echo "Packaging awesome-website..."
	zip -r awesome-website.zip awesome-api u2_tarea0/dist/

lint: ## Ejecutar linters en archivos Markdown
	@echo "Running linters..."
	markdownlint README.md DEPLOY.md

deploy-preview: ## Desplegar a Netlify sitio de vista previa
	@echo "Deploying to Netlify preview site..."
	netlify deploy --dir=./u2_tarea0/dist/ --message="Deploy preview"

deploy-production: ## Desplegar a Netlify sitio de producción
	@echo "Deploying to Netlify production site..."
	netlify deploy --prod --dir=./u2_tarea0/dist/ --message="Deploy production"

.PHONY: build clean post help package lint deploy-preview deploy-production


