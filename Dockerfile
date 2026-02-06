FROM nginx:alpine
RUN echo "<h1>Deployed via GitHub Actions & Terraform!</h1>" > /usr/share/nginx/html/index.html