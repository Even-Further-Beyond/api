import { GraphQLSchema, GraphQLObjectType } from 'graphql';

import mutations from './mutations';
import queries from './queries';

const Schema = new GraphQLSchema({
  query: new GraphQLObjectType({
    name: 'Query',
    fields: queries,
  }),

  mutation: new GraphQLObjectType({
    name: 'Mutation',
    fields: mutations,
  }),
});

export default Schema;
