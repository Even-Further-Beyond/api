import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
} from 'graphql';

const PersonImage = new GraphQLObjectType({
  name: 'PersonImage',
  description: 'Object containing person image information',
  ['sqlTable' as string]: 'person_image',
  ['uniqueKey' as string]: ['id'],
  fields: () => {
    return {
      personId: {
        type: new GraphQLNonNull(GraphQLID),
        sqlDeps: ['person_id'],
        resolve: (personImage) => personImage.person_id,
      },
      imagePath: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['image_path'],
        resolve: (personImage) => personImage.image_path,
      },
      createdAt: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['created_at'],
        resolve: (personImage) => personImage.created_at,
      },
    };
  },
});

export default PersonImage;
