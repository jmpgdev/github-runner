FROM ubuntu:latest

ENV RUNNER_VERSION=2.328.0
ENV URL=https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-arm-${RUNNER_VERSION}.tar.gz

# COPY scripts/deploy.sh /usr/local/bin/deploy.sh
# RUN chmod +x /usr/local/bin/deploy.sh

RUN apt-get update && apt-get install -y curl
RUN mkdir actions-runner
WORKDIR /actions-runner

RUN curl -o actions-runner-linux-arm-${RUNNER_VERSION}.tar.gz -L ${URL}
RUN tar xzf ./actions-runner-linux-arm-${RUNNER_VERSION}.tar.gz

RUN ./config.sh --url "$GITHUB_URL" --token "$GITHUB_TOKEN"
ENTRYPOINT ["./run.sh"]