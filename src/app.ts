import * as winston from 'winston';
import * as moment from 'moment';
import * as bodyParser from 'body-parser';

import { Application } from 'express';
import { createExpressServer } from 'routing-controllers';
import { Model } from 'objection';
import { graphqlExpress, graphiqlExpress } from 'apollo-server-express';

import Logger from './core/Logger';
import banner from './core/banner';
import Environment from './core/Environment';
import knex from './core/database';

import Schema from './api/schemas';
import Models from './api/models';

const logger = new Logger(__filename);

winston.configure({
  transports: [
    new winston.transports.Console({
      level: Environment.log.level,
      handleExceptions: true,
      json: Environment.log.json,
      timestamp: () => moment().format('YYYY-MM-DD HH:mm:ss.SSSS'),
      colorize: Environment.isDevelopment,
    }),
  ],
});

const expressApp: Application = createExpressServer({
  cors: true,
  classTransformer: true,
  routePrefix: Environment.app.routePrefix,
  defaultErrorHandler: false,
  middlewares: Environment.app.directories.middlewares,
});

expressApp.listen(Environment.app.port);

Model.knex(knex);

expressApp.use(Environment.graphql.route, bodyParser.json(), graphqlExpress((req) => ({
  context: {
    knex,
    Models,
  },
  schema: Schema,
})));

if (Environment.graphql.editor) {
  expressApp.use('/graphiql', graphiqlExpress({endpointURL: Environment.graphql.route}));
}

banner(logger);
