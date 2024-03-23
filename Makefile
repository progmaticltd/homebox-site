# Variables
now := $(shell date +%F)

# Get working directory
work_dir := $(shell pwd)

webdir := "web/"
docdir := "web/doc"

perms:
	chmod 0755 web
	chmod 0755 logs
	find web -type d | xargs chmod 0755
	find web -type f | xargs chmod 0644

publish: perms
	rsync -ar --delete --chown=root:root web/ root@voodoo.homebox.space:/var/www/www.homebox.space/
	rsync -ar --delete --chown=root:root web/ root@voodoo.homebox.space:/var/www/homebox.space/
	rsync -ar --delete --chown=root:root web/ root@voodoo.homebox.space:/var/www/default

# preview the site in a docker instance, used for local development.
.PHONY: preview-start preview-stop
preview-restart: preview-stop preview-start
preview-start: perms
	docker build -t homebox-site .
	docker run -d -v ${work_dir}/web/:/usr/share/nginx/html:ro -p 8005:80 homebox-site
preview-stop:
	docker stop `docker ps -a -q  --filter ancestor=homebox-site`
