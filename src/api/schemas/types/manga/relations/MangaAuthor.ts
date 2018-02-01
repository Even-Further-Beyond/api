import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLString,
} from 'graphql';

import Manga from '../../manga';
import Person from '../../person';

const MangaAuthor = new GraphQLObjectType({
  name: 'MangaAuthor',
  description: 'Object containing manga author information',
  ['sqlTable' as string]: 'manga_author',
  ['uniqueKey' as string]: ['manga_id', 'person_id', 'role'],
  fields: () => {
    return {
      manga: {
        type: Manga,
        sqlJoin(mangaAuthorTable, mangaTable) {
          return `${mangaTable}.id = ${mangaAuthorTable}.manga_id`;
        },
      },
      person: {
        type: Person,
        sqlJoin(mangaAuthorTable, personTable) {
          return `${personTable}.id = ${mangaAuthorTable}.person_id`;
        },
      },
      role: {
        type: new GraphQLNonNull(GraphQLString),
      },
      createdAt: {
        type: GraphQLString,
        sqlDeps: ['created_at'],
        resolve: (characterAnime) => characterAnime.created_at,
      },
    };
  },
});

export default MangaAuthor;
