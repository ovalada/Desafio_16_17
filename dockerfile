# Dockerfile
FROM node:14

# Configurar directorio de trabajo
WORKDIR /app

# Copiar archivos de la aplicación
COPY package*.json ./
COPY app/ .

# Instalar dependencias
RUN npm install

# Configurar MongoDB
FROM mongo:latest

# Configurar Nginx
FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=0 /app /usr/share/nginx/html

# Exponer puertos
EXPOSE 3000
EXPOSE 80

# Comando de inicio
CMD ["nginx", "-g", "daemon off;"]

