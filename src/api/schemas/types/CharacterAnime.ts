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
  ['sqlTable' as string]: 'character_anime',
  ['uniqueKey' as string]: ['character_id', 'anime_id'],
  fields: () => {
    return {
      character: {
        type: Character,
        sqlJoin(characterAnimeTable, characterTable) {
          return `${characterTable}.id = ${characterAnimeTable}.character_id`;
        },
      },
      anime: {
        type: Anime,
        sqlJoin(characterAnimeTable, animeTable) {
          return `${animeTable}.id = ${characterAnimeTable}.anime_id`;
        },
      },
      role: { type: new GraphQLNonNull(GraphQLString) },
      createdAt: {
        type: GraphQLString,
        sqlDeps: ['created_at'],
        resolve: (characterAnime) => characterAnime.created_at,
      },
    };
  },
});

export default CharacterAnime;
