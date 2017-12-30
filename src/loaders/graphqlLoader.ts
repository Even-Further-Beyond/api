import { MicroframeworkSettings, MicroframeworkLoader } from 'microframework';
import { graphqlExpress, graphiqlExpress } from 'apollo-server-express';
import * as bodyParser from 'body-parser';

import Environment from '../core/Environment';
import Schema from '../api/schemas';
import models from '../api/models';

const graphqlLoader: MicroframeworkLoader = (settings: MicroframeworkSettings | undefined) => {
  if (settings) {
    const expressApp = settings.getData('express_app');
    const knex = settings.getData('connection');

    expressApp.use(Environment.graphql.route, bodyParser.json(), graphqlExpress((req) => ({
      context: {
        knex,
        models,
      },
      schema: Schema,
    })));

    if (Environment.graphql.editor) {
      expressApp.use('/graphiql', graphiqlExpress({endpointURL: Environment.graphql.route}));
    }
  }
};

export default graphqlLoader;
