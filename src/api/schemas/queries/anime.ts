import joinMonster from 'join-monster';

import { forwardConnectionArgs } from 'graphql-relay';

import { AnimeConnection } from '../types/anime';
import Logger from '../../../core/Logger';

const logger = new Logger(__filename);

export default {
  type: AnimeConnection,
  description: 'Get multiple anime',
  args: forwardConnectionArgs,
  sqlPaginate: true,
  orderBy: {
    id: 'asc',
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
