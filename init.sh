docker run -it --rm --name init-certbot \
	-v "${PWD}/certbot/conf:/etc/letsencrypt" \
	certbot/certbot certonly --standalone