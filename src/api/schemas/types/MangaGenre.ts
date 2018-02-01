import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
} from 'graphql';

const MangaGenre = new GraphQLObjectType({
  name: 'MangaGenre',
  description: 'Object containing manga genre information',
  ['sqlTable' as string]: 'manga_genre',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: { type: new GraphQLNonNull(GraphQLID) },
      name: { type: new GraphQLNonNull(GraphQLString) },
      description: { type: GraphQLString },
    };
  },
});

export default MangaGenre;
