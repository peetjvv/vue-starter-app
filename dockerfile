FROM node:18-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Copy code
COPY . .

# Build
RUN npm run build

EXPOSE 80
CMD [ "npm", "run", "serve" ]

# TODO: make the final output smaller by using a nginx runner image