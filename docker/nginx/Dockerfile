FROM nginx:latest

# Copie o arquivo de configuração do NGINX
COPY nginx.conf /etc/nginx/nginx.conf
COPY certificate.pem /etc/nginx/certificate.pem
COPY server.pem /etc/nginx/server.pem
RUN rm /etc/nginx/conf.d/default.conf
# Inicie o NGINX
CMD ["nginx", "-g", "daemon off;"]
