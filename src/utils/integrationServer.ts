import request = require('request-promise');
import express = require('express');

import { graphqlExpress } from 'apollo-server-express';
import * as Knex from 'knex';
import * as bodyParser from 'body-parser';

import Environment from '../core/Environment';
import Schema from '../api/schemas';
import Models from '../api/models';

function start(done) {
  const app = express();

  const knex = Knex({
    client: Environment.db.client,
    connection: {
      host: Environment.db.host,
      user: Environment.db.user,
      password: Environment.db.password,
      database: Environment.db.name,
    },
  });

  app.use(Environment.graphql.route, bodyParser.json(), graphqlExpress((req) => ({
    context: {
      knex,
      Models,
    },
    schema: Schema,
  })));

  return app.listen(Environment.app.port, () => {
    console.log(`Server started at port ${Environment.app.port}`);
    done();
  });
}

function stop(app, done) {
  app.close();
  console.log(`Stopped server at port ${Environment.app.port}`);
  done();
}

function graphqlQuery(query) {
  return request({
    baseUrl: `http://localhost:${Environment.app.port}`,
    uri: 'graphql',
    qs: {
      query,
    },
    resolveWithFullResponse: true,
    json: true,
  });
}

export default {
  start,
  stop,
  graphqlQuery,
};
