mkdir conf-volume \
	&& mkdir conf-cont \
	&& cd conf-cont \
	&& cp /vagrant/Dockerfile . \
	&& cp /vagrant/response.varfile .
docker build -t confluance	.
docker run --rm --name confluance-machine -d -p 8080:8090 confluance