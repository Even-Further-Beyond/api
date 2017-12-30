import { MicroframeworkSettings, MicroframeworkLoader } from 'microframework';
import * as Knex from 'knex';
import { Model } from 'objection';

import Environment from '../core/Environment';

const objectionLoader: MicroframeworkLoader = (settings: MicroframeworkSettings | undefined) => {
  const knex = Knex({
    client: Environment.db.client,
    connection: {
      host: Environment.db.host,
      user: Environment.db.user,
      password: Environment.db.password,
      database: Environment.db.name,
    },
  });

  (settings as MicroframeworkSettings).setData('connection', knex);

  Model.knex(knex);
};

export default objectionLoader;
