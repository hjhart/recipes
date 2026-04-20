FROM node:20-slim

RUN apt-get update && apt-get install -y \
    python3 git curl \
    && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
       | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
       > /etc/apt/sources.list.d/github-cli.list \
    && apt-get update && apt-get install -y gh \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @anthropic-ai/claude-code

COPY scripts/recipe-webhook.py /app/recipe-webhook.py

ENV PROJECT_DIR=/workspace/recipes
ENV CLAUDE_BIN=/usr/local/bin/claude
ENV TOKEN_FILE=/run/secrets/webhook-token

WORKDIR /workspace/recipes

CMD ["python3", "/app/recipe-webhook.py"]
