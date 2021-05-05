FROM docker:latest

RUN apk update
# Install base and dev packages
RUN apk add --no-cache --virtual .build-deps
RUN apk add bash
# Install build packages
RUN apk add make && apk add curl && apk add openssh
# Install git
RUN apk add git

RUN apk add --no-cache curl gettext py-pip \
	&& pip install awscli \
	&& curl -kLO "https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl" \
	&& chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

CMD ["sh"]
