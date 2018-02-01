import {
  GraphQLID,
} from 'graphql';

import Character from '../types/character';

export default {
  type: Character,
  description: 'Update single anime character',
  args: { id: { type: GraphQLID } },
  resolve: (parent, args, {}, info) => {
    return undefined;
  },
};
