FROM node:lts

RUN apt update
RUN apt install -y openssh-server curl git

# Replace sshd_config
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /var/run/sshd

CMD echo root:$PASSWORD | chpasswd \
	&& exec /usr/sbin/sshd -D -e