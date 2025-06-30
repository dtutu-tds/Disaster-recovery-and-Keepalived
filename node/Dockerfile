#----------------------------------
#------------Dockerfile------------
#----------------------------------

 # легкий образ
    FROM alpine:3.20           

# ставим пакеты 
    RUN apk add --no-cache nginx keepalived bash iproute2 curl gettext                                      

# кладем стартовую страничку
    RUN echo "Hello from $(cat /etc/alpine-release)" > /var/www/localhost/htdocs/index.html            
    RUN mkdir -p /usr/share/nginx/html \
    && cp /var/www/localhost/htdocs/index.html /usr/share/nginx/html/index.html
# переносим скрипт проверки healthcheck
    COPY check_web.sh /usr/local/bin/check_web.sh                                                       
    RUN chmod +x /usr/local/bin/check_web.sh                                                            

# шаблон конфигурации
    COPY keepalived.tmpl /etc/keepalived/keepalived.tmpl                                                

# значения для интервала проверки
    ENV INTERVAL=3 VIP=192.168.100.200/24 VRID=42                                                      
    CMD envsubst < /etc/keepalived/keepalived.tmpl > /etc/keepalived/keepalived.conf \
    && nginx -g "daemon off;" & \
    exec keepalived -n -l -D -f /etc/keepalived/keepalived.conf
