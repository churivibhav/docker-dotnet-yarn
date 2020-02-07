FROM mcr.microsoft.com/dotnet/core/sdk:3.1

RUN curl -L https://github.com/a8m/envsubst/releases/download/v1.1.0/envsubst-`uname -s`-`uname -m` -o envsubst && \
  chmod +x envsubst &&\
  mv envsubst /usr/local/bin &&\
  dotnet tool install -g Amazon.Lambda.Tools &&\
  curl -sL https://deb.nodesource.com/setup_12.x | bash - &&\
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && \
  apt-get install -y nodejs yarn python3-pip zip jq nuget && \
  pip3 install awscli --upgrade --user &&\
  export PATH=~/.local/bin:$PATH &&\
  rm -rf /var/lib/apt/lists/*
