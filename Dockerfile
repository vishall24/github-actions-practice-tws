FROM node:18-alpine

WORKDIR /app

# Create non-root user
RUN adduser -D appuser

# Fix permissions
RUN chown -R appuser /app

# Switch user
USER appuser

COPY . .

RUN npm install

CMD ["node", "app.js"]