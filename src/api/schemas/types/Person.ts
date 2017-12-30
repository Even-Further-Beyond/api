import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLID,
  GraphQLInt,
  GraphQLList,
  GraphQLString,
} from 'graphql';

import PersonImage from './PersonImage';

const Person = new GraphQLObjectType({
  name: 'Person',
  description: 'Object containing person information',
  ['sqlTable' as string]: 'people',
  ['uniqueKey' as string]: ['id'],
  fields: () => {
    return {
      id: { type: new GraphQLNonNull(GraphQLID) },
      malId: {
        type: GraphQLInt,
        sqlDeps: ['mal_id'],
        resolve: (person) => person.mal_id,
      },
      slug: { type: new GraphQLNonNull(GraphQLString) },
      name: { type: new GraphQLNonNull(GraphQLString) },
      alternativeNames: {
        type: new GraphQLList(GraphQLString),
        sqlDeps: ['alternative_names'],
        resolve: (person) => person.alternative_names,
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
      birthday: { type: GraphQLString },
      image: {
        type: PersonImage,
        sqlJoin(peopleTable, peopleImagesTable) {
          return `${peopleImagesTable}.id = ${peopleTable}.image_id`;
        },
      },
      images: {
        type: new GraphQLList(PersonImage),
        sqlJoin(peopleTable, peopleImagesTable) {
          return `${peopleImagesTable}.person_id = ${peopleTable}.id`;
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

export default Person;
