import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
} from 'graphql';

const Color = new GraphQLObjectType({
  name: 'Color',
  description: 'Object containing color information',
  ['sqlTable' as string]: 'color',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: { type: new GraphQLNonNull(GraphQLID) },
      name: { type: new GraphQLNonNull(GraphQLString) },
    };
  },
});

export default Color;
