FROM jenkins/jenkins:lts

USER root

ARG TERRAFORM_VERSION=1.15.6

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    wget \
    git \
    python3 \
    python3-pip \
    python3-venv \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Terraform from binary release
RUN curl -fsSL "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -o /tmp/terraform.zip && \
    unzip /tmp/terraform.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/terraform && \
    rm -f /tmp/terraform.zip && \
    terraform version

# Install AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && \
    unzip /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install && \
    rm -rf /tmp/aws /tmp/awscliv2.zip && \
    aws --version

# Install OPA
RUN curl -L -o /usr/local/bin/opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64_static && \
    chmod +x /usr/local/bin/opa && \
    opa version

# Install Checkov in virtual environment
RUN python3 -m venv /opt/checkov-venv && \
    /opt/checkov-venv/bin/pip install --upgrade pip && \
    /opt/checkov-venv/bin/pip install checkov && \
    ln -s /opt/checkov-venv/bin/checkov /usr/local/bin/checkov && \
    checkov --version

USER jenkins