FROM debian:bullseye

RUN apt-get update && \
    apt-get -y install python3.9 python3-pip git && \
    rm -rf /var/lib/apt/lists/*

# Install Terraform
RUN apt-get update && \
    apt-get -y install curl unzip net-tools vim && \
    curl -LO https://releases.hashicorp.com/terraform/1.1.0/terraform_1.1.0_linux_amd64.zip && \
    unzip terraform_1.1.0_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_1.1.0_linux_amd64.zip

WORKDIR /app

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

CMD [ "/bin/bash" ]