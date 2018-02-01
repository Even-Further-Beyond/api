import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLString,
} from 'graphql';

import Manga from '../../manga';
import Character from '../index';

const CharacterManga = new GraphQLObjectType({
  name: 'CharacterManga',
  description: 'Object containing character manga information',
  ['sqlTable' as string]: 'character_manga',
  ['uniqueKey' as string]: ['character_id', 'manga_id'],
  fields: () => {
    return {
      character: {
        type: Character,
        sqlJoin(characterMangaTable, characterTable) {
          return `${characterTable}.id = ${characterMangaTable}.character_id`;
        },
      },
      manga: {
        type: Manga,
        sqlJoin(characterMangaTable, mangaTable) {
          return `${mangaTable}.id = ${characterMangaTable}.manga_id`;
        },
      },
      role: { type: new GraphQLNonNull(GraphQLString) },
      createdAt: {
        type: GraphQLString,
        sqlDeps: ['created_at'],
        resolve: (characterManga) => characterManga.created_at,
      },
    };
  },
});

export default CharacterManga;
