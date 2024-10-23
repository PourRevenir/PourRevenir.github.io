# 使用官方Nginx镜像作为基础镜像
FROM nginx
# 维护者信息
LABEL maintainer="liheng.csu@csu.edu.cn"
# 设置容器内的工作目录
WORKDIR /usr/share/nginx/html
# 将当前目录中的所有文件复制到Nginxpwd的默认静态文件目录
COPY /public /usr/share/nginx/html
# 暴露端口80
EXPOSE 80
# 启动Nginx
CMD ["nginx", "-g", "daemon off;"]
# docker build -t PourRevenir .