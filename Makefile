# Definición de la variable RMDIR
ifeq ($(OS),Windows_NT)
  RMDIR = powershell -Command "Remove-Item -Recurse -Force"
else
  RMDIR = rm -rf
endif

# Variable HUGO
HUGO = hugo

# Objetivo build: Generar el sitio web
build: ## Build the website
	$(HUGO) -d u2_tarea0/dist/

# Objetivo clean: Limpiar el contenido del directorio dist
clean: ## Clean the dist directory
	$(RMDIR) u2_tarea0/dist

# Objetivo post: Crear una nueva entrada de blog
post: ## Create a new blog post
	hugo new posts/$(POST_NAME).md
ifeq ($(OS),Windows_NT)
	powershell -Command "(Get-Content content/posts/$(POST_NAME).md) -replace 'title:.*', 'title: \"$(POST_TITLE)\"' | Set-Content content/posts/$(POST_NAME).md"
else
	sed -i 's/title:.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md
endif

# Objetivo help: Mostrar ayuda de los objetivos
help: ## Show this help usage
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'
