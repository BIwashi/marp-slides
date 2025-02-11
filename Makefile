.DEFAULT_GOAL := help

##### EXPORT #####

.PHONY: export/pdf
export/pdf: ## Export to PDF ## make export/pdf
	marp -c .marprc.yaml --pdf --allow-local-files

.PHONY: export/html
export/html: ## Export to HTML ## make export/html
	marp -c .marprc.yaml --html --allow-local-files --output dist/
	mkdir -p dist/images dist/themes/images
	cp -r src/images/* dist/images/
	cp -r src/themes/images/* dist/themes/images/
	find src -name "images" -type d -exec bash -c 'mkdir -p "dist/$${1#src/}" && cp -r "$$1"/* "dist/$${1#src/}"' _ {} \;

##### CLEAN #####

.PHONY: clean/images
clean/images: ## Clean unused images in slide directories ## make clean/images
	@for dir in $$(find src -type f -name "index.md" -exec dirname {} \;); do \
		echo "Cleaning unused images in $$dir..."; \
		used_images=$$(grep -o '!\[.*\]([^)]*)' "$$dir/index.md" | sed 's/.*(\(.*\))/\1/' | sed 's/\.\///' | sort | uniq); \
		for img in "$$dir"/images/*.{png,jpg,jpeg}; do \
			if [ -f "$$img" ]; then \
				img_relative=$$(echo "$$img" | sed "s|$$dir/||"); \
				if ! echo "$$used_images" | grep -q "$$img_relative"; then \
					echo "Removing unused image: $$img"; \
					rm -f "$$img"; \
				fi; \
			fi; \
		done; \
	done

.PHONY: clean/all
clean/all: ## Clean ## make clean/all
	rm -rf dist

##### HELP #####

.PHONY: help
help: ## Display this help screen ## make or make help
	@echo ""
	@echo "Usage: make SUB_COMMAND argument_name=argument_value"
	@echo ""
	@echo "Command list:"
	@echo ""
	@printf "\033[36m%-30s\033[0m %-50s %s\n" "[Sub command]" "[Description]" "[Example]"
	@grep -E '^[/a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | perl -pe 's%^([/a-zA-Z_-]+):.*?(##)%$$1 $$2%' | awk -F " *?## *?" '{printf "\033[36m%-30s\033[0m %-50s %s\n", $$1, $$2, $$3}'
