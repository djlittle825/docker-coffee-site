FROM amazonlinux:latest

# Install dependencies
RUN yum update -y && \
  yum install -y httpd && \
  yum search wget && \
  yum install wget -y && \
  yum install unzip -y

# change directory
RUN cd /var/www/html

# download webfiles
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page292/grandcoffee.zip

# unzip folder
RUN unzip grandcoffee.zip

# copy files into html directory
RUN cp -r html/* /var/www/html/

# remove unwanted folder
RUN rm -rf grandcoffee.zip

# exposes port 80 on the container
EXPOSE 80

# set the default application that will start when the container start
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]