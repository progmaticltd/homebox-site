# Variables
now := $(shell date +%F)

# Get working directory
work_dir := $(shell pwd)

webdir := "web/"
docdir := "web/doc"

sitemap:
	sed -ri "s:(\\s+)<lastmod>([0-9-]+)</lastmod>:\\1<lastmod>$(now)</lastmod>:g" "$(webdir)/sitemap.xml"

publish: sitemap
	rsync -ar --delete --chown=root:root web/ root@voodoo.homebox.space:/var/www/www.homebox.space/
	rsync -ar --delete --chown=root:root web/ root@voodoo.homebox.space:/var/www/homebox.space/
	rsync -ar --delete --chown=root:root web/ root@voodoo.homebox.space:/var/www/default

preview: sitemap
	docker build -t homebox-site .
	docker run -d -v ${work_dir}/web/:/usr/share/nginx/html:ro -p 8005:80 homebox-site
