import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
} from 'graphql';

const CharacterImage = new GraphQLObjectType({
  name: 'CharacterImage',
  description: 'Object containing character image information',
  ['sqlTable' as string]: 'characters_images',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      characterId: {
        type: new GraphQLNonNull(GraphQLID),
        sqlDeps: ['character_id'],
        resolve: (characterImage) => characterImage.character_id,
      },
      imagePath: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['image_path'],
        resolve: (characterImage) => characterImage.image_path,
      },
      createdAt: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['created_at'],
        resolve: (characterImage) => characterImage.created_at,
      },
    };
  },
});

export default CharacterImage;
