FROM amazon/aws-cli:2.27.18

RUN yum update -y && \
    yum install -y unzip curl && \
    yum clean all

ENV VAULT_VERSION=1.15.5

RUN curl -sSLo /tmp/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip /tmp/vault.zip -d /usr/local/bin && \
    rm /tmp/vault.zip && \
    chmod +x /usr/local/bin/vault

RUN vault --version && aws --version

ENTRYPOINT ["/bin/sh"]
