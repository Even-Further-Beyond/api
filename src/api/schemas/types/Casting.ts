import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLString,
} from 'graphql';

import Anime from './anime';
import Person from './person';
import Character from './character';

import Language from './Language';

const Casting = new GraphQLObjectType({
  name: 'Casting',
  description: 'Object containing casting information',
  ['sqlTable' as string]: 'casting',
  ['uniqueKey' as string]: ['id'],
  fields: () => {
    return {
      anime: {
        type: Anime,
        sqlJoin(castingsTable, animeTable) {
          return `${animeTable}.id = ${castingsTable}.anime_id`;
        },
      },
      person: {
        type: Person,
        sqlJoin(castingsTable, peopleTable) {
          return `${peopleTable}.id = ${castingsTable}.person_id`;
        },
      },
      character: {
        type: Character,
        sqlJoin(castingsTable, charactersTable) {
          return `${charactersTable}.id = ${castingsTable}.character_id`;
        },
      },
      language: {
        type: Language,
        sqlJoin(castingsTable, languagesTable) {
          return `${languagesTable}.id = ${castingsTable}.language_id`;
        },
      },
      role: { type: new GraphQLNonNull(GraphQLString) },
      createdAt: {
        type: GraphQLString,
        sqlDeps: ['created_at'],
        resolve: (casting) => casting.created_at,
      },
      updatedAt: {
        type: GraphQLString,
        sqlDeps: ['updated_at'],
        resolve: (casting) => casting.updated_at,
      },
    };
  },
});

export default Casting;
