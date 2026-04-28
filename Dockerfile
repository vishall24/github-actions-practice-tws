FROM node:18-alpine

WORKDIR /app

# Create non-root user
RUN adduser -D appuser

# Copy only required files from builder
COPY --from=builder /app /app

# Fix permissions
RUN chown -R appuser /app

# Switch user
USER appuser

COPY . .

RUN npm install

CMD ["node", "app.js"]