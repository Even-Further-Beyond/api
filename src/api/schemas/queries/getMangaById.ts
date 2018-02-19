import { GraphQLID } from 'graphql';
import * as escape from 'pg-escape';
import joinMonster from 'join-monster';

import Manga from '../types/manga';
import Logger from '../../../core/Logger';

const logger = new Logger(__filename);

export default {
  type: Manga,
  description: 'Get a single manga by id',
  args: { id: { type: GraphQLID } },
  where: (mangaTable, args) => {
    if (args.id) {
      return escape(`${mangaTable}.id = %L`, args.id);
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
