import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
} from 'graphql';

const MangaImage = new GraphQLObjectType({
  name: 'MangaImage',
  description: 'Object containing manga image information',
  ['sqlTable' as string]: 'manga_image',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      mangaId: {
        type: new GraphQLNonNull(GraphQLID),
        sqlDeps: ['manga_id'],
        resolve: (mangaImage) => mangaImage.manga_id,
      },
      imagePath: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['image_path'],
        resolve: (mangaImage) => mangaImage.image_path,
      },
      createdAt: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['created_at'],
        resolve: (mangaImage) => mangaImage.created_at,
      },
    };
  },
});

export default MangaImage;
