# Use full Node.js image (not Alpine)
FROM node:20

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Build the app
RUN npm run build

# Expose the port Strapi runs on
EXPOSE 1337

# Run in production
CMD ["npm", "start"]
