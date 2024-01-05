# Variables
now := $(shell date +%F)

webdir := "web/"
docdir := "web/doc"

sitemap:
	sed -ri "s:(\\s+)<lastmod>([0-9-]+)</lastmod>:\\1<lastmod>$(now)</lastmod>:g" "$(webdir)/sitemap.xml"

publish: sitemap
	rsync -ar --delete --chown=root:root web/ root@voodoo.homebox.space:/var/www/www.homebox.space/
	rsync -ar --delete --chown=root:root web/ root@voodoo.homebox.space:/var/www/homebox.space/
	rsync -ar --delete --chown=root:root web/ root@voodoo.homebox.space:/var/www/default

preview: sitemap
	pidof lighttpd || /usr/sbin/lighttpd -f ./lighttpd.conf -D >>logs/lighttpd.log 2>&1 &
	sensible-browser http://127.0.0.1:8005/ >/dev/null 2>&1 &
