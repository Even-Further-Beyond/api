import {
  GraphQLID,
} from 'graphql';

import Character from '../types/Character';

export default {
  type: Character,
  description: 'Get a single anime character',
  args: { id: { type: GraphQLID } },
  resolve: (parent, args, {}, info) => {
    return undefined;
  },
};
