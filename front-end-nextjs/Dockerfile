FROM node:18-alpine AS base

WORKDIR /app

COPY front-end-nextjs/package.json front-end-nextjs/yarn.lock* front-end-nextjs/package-lock.json* front-end-nextjs/pnpm-lock.yaml* ./
RUN \
  if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm i --frozen-lockfile; \
  else echo "Lockfile not found." && exit 1; \
  fi

COPY . .

#RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]