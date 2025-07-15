FROM run:v1
RUN dnf install nginx -y
RUN rm -rf /usr/share/nginx/html/index.html
ADD https://raw.githubusercontent.com/daws-84s/notes/refs/heads/main/session-01.txt /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]