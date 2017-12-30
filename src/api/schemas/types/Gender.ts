import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
} from 'graphql';

const Gender = new GraphQLObjectType({
  name: 'Gender',
  description: 'Object containing gender information',
  ['sqlTable' as string]: 'genders',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: { type: new GraphQLNonNull(GraphQLID) },
      description: { type: new GraphQLNonNull(GraphQLString) },
    };
  },
});

export default Gender;
