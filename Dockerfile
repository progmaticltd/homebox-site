FROM nginx

# Use specific configuration (ssi)
COPY preview/nginx.conf /etc/nginx/conf.d/default.conf

# Copy web site content
# COPY web /usr/share/nginx/html
