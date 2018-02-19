import joinMonster from 'join-monster';
import { nodeDefinitions, fromGlobalId } from 'graphql-relay';

import knex from '../../../core/database';

const { nodeInterface, nodeField } = nodeDefinitions(
  (globalId, context, resolveInfo) => {
    const { type, id } = fromGlobalId(globalId);

    return joinMonster.getNode(type, resolveInfo, context, parseInt(id, 10), sql => knex.raw(sql));
  }
);

export { nodeInterface, nodeField };
