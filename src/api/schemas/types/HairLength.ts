import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
} from 'graphql';

const HairLength = new GraphQLObjectType({
  name: 'HairLength',
  description: 'Object containing hair length information',
  ['sqlTable' as string]: 'hair_length',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: { type: new GraphQLNonNull(GraphQLID) },
      description: { type: new GraphQLNonNull(GraphQLString) },
    };
  },
});

export default HairLength;
