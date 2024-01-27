# Variables
now := $(shell date +%F)

# Get working directory
work_dir := $(shell pwd)

webdir := "web/"
docdir := "web/doc"

publish:
	rsync -ar --delete --chown=root:root web/ root@voodoo.homebox.space:/var/www/www.homebox.space/
	rsync -ar --delete --chown=root:root web/ root@voodoo.homebox.space:/var/www/homebox.space/
	rsync -ar --delete --chown=root:root web/ root@voodoo.homebox.space:/var/www/default

# preview the site in a docker instance, used for local development.
.PHONY: preview
preview:
	docker build -t homebox-site .
	docker run -d -v ${work_dir}/web/:/usr/share/nginx/html:ro -p 8005:80 homebox-site
