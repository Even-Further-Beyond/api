import { GraphQLID } from 'graphql';
import * as escape from 'pg-escape';
import joinMonster from 'join-monster';

import Anime from '../types/anime';
import Logger from '../../../core/Logger';

const logger = new Logger(__filename);

export default {
  type: Anime,
  description: 'Get a single anime by id',
  args: { id: { type: GraphQLID } },
  where: (animeTable, args) => {
    if (args.id) {
      return escape(`${animeTable}.id = %L`, args.id);
    }
  },
  resolve: (parent, args, { knex }, info) => {
    return joinMonster(info, {}, sql => {
      logger.info(`\n ${sql}`);
      return knex.raw(sql).then(result => {
        logger.info(`Returned ${result.rowCount} rows`);
        return result;
      })
      .catch(error => {
        logger.error(error);
      });
    }, {dialect: 'pg'});
  },
};
