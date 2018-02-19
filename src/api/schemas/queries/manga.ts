import joinMonster from 'join-monster';

import { forwardConnectionArgs } from 'graphql-relay';

import { MangaConnection } from '../types/manga';
import Logger from '../../../core/Logger';

const logger = new Logger(__filename);

export default {
  type: MangaConnection,
  description: 'Get multiple manga',
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
