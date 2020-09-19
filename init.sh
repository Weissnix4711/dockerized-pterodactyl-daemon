docker run -it --rm --name init-certbot \
	-p 80:80 \
	-v "${PWD}/certbot/conf:/etc/letsencrypt" \
	certbot/certbot certonly --standalone
