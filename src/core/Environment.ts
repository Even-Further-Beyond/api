import * as path from 'path';
import * as dotenv from 'dotenv';

dotenv.config({
  path: path.join(process.cwd(), `.env${((process.env.NODE_ENV === 'test') ? '.test' : '')}`),
});

const toBoolean = (value: string | undefined): boolean => {
  return value === 'true';
};

export const Environment = {
  node: process.env.NODE_ENV || 'development',
  isProduction: process.env.NODE_ENV === 'production',
  isTest: process.env.NODE_ENV === 'test',
  isDevelopment: process.env.NODE_ENV === 'development',
  app: {
    name: process.env.APP_NAME,
    route: process.env.APP_ROUTE,
    routePrefix: process.env.APP_ROUTE_PREFIX,
    port: process.env.PORT || '3000',
    directories: {
      middlewares: [path.join(__dirname, '..', 'api/middlewares/*{.js,.ts}')],
    },
  },
  db: {
    client: process.env.DB_TYPE || 'pg',
    host: process.env.DB_HOST || 'localhost',
    port: process.env.DB_PORT || 5432,
    user: process.env.DB_USER || 'postgres',
    password: process.env.DB_PASSWORD || '',
    name: process.env.DB_NAME || 'acdb_1',
  },
  log: {
    level: process.env.LOG_LEVEL,
    json: toBoolean(process.env.LOG_JSON),
    output: process.env.LOG_OUTPUT as string,
  },
  graphql: {
    route: process.env.GRAPHQL_ROUTE as string || '/graphql',
    editor: process.env.GRAPHQL_EDITOR,
  },
  monitor: {
    enabled: process.env.MONITOR_ENABLED,
    route: process.env.MONITOR_ROUTE,
  },
};

export default Environment;
