FROM docker:latest

RUN apk add --no-cache curl gettext py-pip \
	&& pip install awscli \
	&& curl -kLO "https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl" \
	&& chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl \
    && pip install awsebcli==3.14.5

CMD ["sh"]
