import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLList,
  GraphQLString,
  GraphQLInt,
} from 'graphql';

import { connectionDefinitions } from 'graphql-relay';

import { nodeInterface } from '../Node';

import PersonImage from './relations/PersonImage';

import Casting from '../Casting';

const Person = new GraphQLObjectType({
  name: 'Person',
  description: 'Object containing person information',
  ['sqlTable' as string]: 'person',
  ['uniqueKey' as string]: ['id'],
  interfaces: [nodeInterface],
  fields: () => {
    return {
      id: {
        type: new GraphQLNonNull(GraphQLID),
      },
      malId: {
        type: new GraphQLNonNull(GraphQLID),
        sqlDeps: ['mal_id'],
        resolve: (person) => person.mal_id,
      },
      firstName: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['first_name'],
        resolve: (person) => person.first_name,
      },
      surname: {
        type: GraphQLString,
        sqlDeps: ['surname'],
        resolve: (person) => person.surname,
      },
      givenName: {
        type: GraphQLString,
        sqlDeps: ['given_name'],
        resolve: (person) => person.given_name,
      },
      familyName: {
        type: GraphQLString,
        sqlDeps: ['family_name'],
        resolve: (person) => person.family_name,
      },
      alternativeNames: {
        type: new GraphQLList(GraphQLString),
        sqlDeps: ['alternative_names'],
        resolve: (person) => person.alternative_names,
      },
      birthday: {
        type: GraphQLString,
      },
      website: {
        type: GraphQLString,
      },
      description: {
        type: GraphQLString,
      },
      image: {
        type: PersonImage,
        sqlJoin(personTable, personImageTable) {
          return `${personImageTable}.id = ${personTable}.image_id`;
        },
      },
      castings: {
        type: new GraphQLList(Casting),
        sqlJoin(personTable, castingTable) {
          return `${castingTable}.person_id = ${personTable}.id`;
        },
      },
      createdAt: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['created_at'],
        resolve: (person) => person.created_at,
      },
      updatedAt: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['updated_at'],
        resolve: (person) => person.updated_at,
      },
    };
  },
});

export const { connectionType: PersonConnection } = connectionDefinitions({
  nodeType: Person,
  connectionFields: {
    total: { type: GraphQLInt },
  },
});

export default Person;
