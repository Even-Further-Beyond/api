import { GraphQLID } from 'graphql';
import * as escape from 'pg-escape';
import joinMonster from 'join-monster';

import Character from '../types/Character';
import Logger from '../../../core/Logger';

const logger = new Logger(__filename);

export default {
  type: Character,
  description: 'Get a single character by id',
  args: { id: { type: GraphQLID } },
  where: (charactersTable, args) => {
    if (args.id) {
      return escape(`${charactersTable}.id = %L`, args.id);
    }
  },
  resolve: (parent, args, { knex }, info) => {
    return joinMonster(info, {}, (sql) => {
      logger.info(`\n ${sql}`);
      return knex.raw(sql).then(result => {
        logger.info(`Returned ${result.rowCount} rows`);
        return result;
      })
      .catch(error => {
        logger.error(error);
      });
    });
  },
};
