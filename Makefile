#Authored by Phillip Bailey
.PHONY: all
.SILENT:

all:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

push:  ## push
	git add . && git commit -m "`date`" && git push origin master || true

pull:  ## pull
	git pull origin master

