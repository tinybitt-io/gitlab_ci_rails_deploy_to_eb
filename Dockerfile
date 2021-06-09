FROM docker:latest

ENV APP_HOME /var/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apk update
# Install base and dev packages
RUN apk add --no-cache --virtual .build-deps

RUN apk add --no-cache bash make curl openssh git gettext py-pip ca-certificates gzip jq procps wget\
	&& pip install awscli \
	&& curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
	&& install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

COPY kustomize kustomize
RUN chmod +x ./kustomize && mv ./kustomize /usr/local/bin/kustomize

CMD ["sh"]