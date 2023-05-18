FROM centos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN dnf -y update
RUN dnf -y install httpd
EXPOSE 80/tcp
CMD ["-D", "FOREGROUND"] 
ENTRYPOINT ["/usr/sbin/httpd"]
