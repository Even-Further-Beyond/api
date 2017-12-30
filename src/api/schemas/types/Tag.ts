import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
  GraphQLBoolean,
} from 'graphql';

const Tag = new GraphQLObjectType({
  name: 'Tag',
  description: 'Object containing tag information',
  ['sqlTable' as string]: 'tags',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: { type: GraphQLID },
      name: { type: GraphQLString },
      description: { type: GraphQLString },
      isCategory: {
        type: GraphQLBoolean,
        sqlDeps: ['is_category'],
        resolve: (tag) => tag.is_category,
      },
      parentId: {
        type: GraphQLID,
        sqlDeps: ['parent_id'],
        resolve: (tag) => tag.parent_id,
      },
      slug: { type: GraphQLString },
      createdAt: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['created_at'],
        resolve: (tag) => tag.created_at,
      },
      updatedAt: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['updated_at'],
        resolve: (tag) => tag.updated_at,
      },
    };
  },
});

export default Tag;
