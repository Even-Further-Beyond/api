import { GraphQLString } from 'graphql';
import joinMonster from 'join-monster';
import * as escape from 'pg-escape';

import { forwardConnectionArgs } from 'graphql-relay';

import { AnimeConnection } from '../types/anime';
import Logger from '../../../core/Logger';

const logger = new Logger(__filename);

export default {
  type: AnimeConnection,
  description: 'Get multiple anime',
  args: {
    ...forwardConnectionArgs,
    name: { type: GraphQLString},
  },
  sqlPaginate: true,
  orderBy: {
    id: 'asc',
  },
  where: (animeTable, args) => {
    if (args.name) {
      return escape(`${animeTable}.main_title ILIKE %L`, `%${args.mainTitle}%`);
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
