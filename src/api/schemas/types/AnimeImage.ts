import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
} from 'graphql';

const AnimeImage = new GraphQLObjectType({
  name: 'AnimeImage',
  description: 'Object containing anime image information',
  ['sqlTable' as string]: 'anime_images',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      animeId: {
        type: new GraphQLNonNull(GraphQLID),
        sqlDeps: ['anime_id'],
        resolve: (animeImage) => animeImage.anime_id,
      },
      imagePath: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['image_path'],
        resolve: (animeImage) => animeImage.image_path,
      },
      createdAt: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['created_at'],
        resolve: (animeImage) => animeImage.created_at,
      },
    };
  },
});

export default AnimeImage;
