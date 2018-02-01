import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
} from 'graphql';

const AnimeGenre = new GraphQLObjectType({
  name: 'AnimeGenre',
  description: 'Object containing anime genre information',
  ['sqlTable' as string]: 'anime_genre',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: { type: new GraphQLNonNull(GraphQLID) },
      name: { type: new GraphQLNonNull(GraphQLString) },
      description: { type: GraphQLString },
    };
  },
});

export default AnimeGenre;
