import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
} from 'graphql';

const Language = new GraphQLObjectType({
  name: 'Language',
  description: 'Object containing language information',
  ['sqlTable' as string]: 'language',
  ['uniqueKey' as string]: ['id'],
  fields: () => {
    return {
      id: { type: new GraphQLNonNull(GraphQLID) },
      name: { type: new GraphQLNonNull(GraphQLString) },
    };
  },
});

export default Language;
