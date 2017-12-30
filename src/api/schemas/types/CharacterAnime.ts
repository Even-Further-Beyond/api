import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLString,
} from 'graphql';

import Anime from './Anime';
import Character from './Character';

const CharacterAnime = new GraphQLObjectType({
  name: 'CharacterAnime',
  description: 'Object containing character anime information',
  ['sqlTable' as string]: 'characters_anime',
  ['uniqueKey' as string]: ['id'], // Composite key doesn't work here, probably need to add unique id column
  fields: () => {
    return {
      character: {
        type: Character,
        sqlJoin(charactersAnimeTable, characterTable) {
          return `${characterTable}.id = ${charactersAnimeTable}.character_id`;
        },
      },
      anime: {
        type: Anime,
        sqlJoin(charactersAnimeTable, animeTable) {
          return `${animeTable}.id = ${charactersAnimeTable}.anime_id`;
        },
      },
      role: { type: new GraphQLNonNull(GraphQLString) },
      createdAt: {
        type: GraphQLString,
        sqlDeps: ['created_at'],
        resolve: (characterAnime) => characterAnime.created_at,
      },
      updatedAt: {
        type: GraphQLString,
        sqlDeps: ['updated_at'],
        resolve: (characterAnime) => characterAnime.updated_at,
      },
    };
  },
});

export default CharacterAnime;
