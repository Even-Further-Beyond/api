import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
} from 'graphql';

const Genre = new GraphQLObjectType({
  name: 'Genre',
  description: 'Object containing genre information',
  ['sqlTable' as string]: 'genres',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: { type: new GraphQLNonNull(GraphQLID) },
      name: { type: new GraphQLNonNull(GraphQLString) },
      description: { type: GraphQLString },
    };
  },
});

export default Genre;
