buildah from registry.access.redhat.com/ubi8/ubi:latest
buildah containers
buildah run ubi-working-container -- yum -y install httpd nmap nmap-ncat
echo 'Hello World!' > index.html
chmod 664 index.html
buildah copy ubi-working-container index.html /var/www/html/index.html
buildah config --cmd "/usr/sbin/httpd -D FOREGROUND" ubi-working-container
buildah config --port 80 ubi-working-container
buildah commit ubi-working-container httpd
podman login quay.io
podman tag localhost/httpd:latest quay.io/swains/httpd:latest
podman push quay.io/swains/httpd:latest
