import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLString,
} from 'graphql';

const AgeGroup = new GraphQLObjectType({
  name: 'AgeGroup',
  description: 'Object containing age group information',
  ['sqlTable' as string]: 'age_groups',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: { type: new GraphQLNonNull(GraphQLID) },
      name: { type: new GraphQLNonNull(GraphQLString) },
      description: { type: GraphQLString },
    };
  },
});

export default AgeGroup;
