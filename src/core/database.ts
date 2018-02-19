import Environment from './Environment';
import * as Knex from 'knex';

const knex = Knex({
  client: Environment.db.client,
  connection: {
    host: Environment.db.host,
    user: Environment.db.user,
    password: Environment.db.password,
    database: Environment.db.name,
  },
});

export default knex;
