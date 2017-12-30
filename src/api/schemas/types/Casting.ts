import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLString,
  GraphQLBoolean,
} from 'graphql';

import Anime from './Anime';
import Person from './Person';
import Character from './Character';
import Language from './Language';

const Casting = new GraphQLObjectType({
  name: 'Casting',
  description: 'Object containing casting information',
  ['sqlTable' as string]: 'castings',
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
      isVoiceActor: {
        type: new GraphQLNonNull(GraphQLBoolean),
        sqlDeps: ['is_voice_actor'],
        resolve: (casting) => casting.is_voice_actor,
      },
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
