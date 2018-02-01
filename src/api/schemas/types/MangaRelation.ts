import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLString,
} from 'graphql';

import Manga from './Manga';

const MangaRelation = new GraphQLObjectType({
  name: 'MangaRelation',
  description: 'Object containing manga relation information',
  ['sqlTable' as string]: 'manga_relation',
  ['uniqueKey' as string]: ['parent_id', 'child_id', 'type'],
  fields: () => {
    return {
      manga: {
        type: Manga,
        sqlJoin(mangaRelationTable, mangaTable) {
          return `${mangaTable}.id = ${mangaRelationTable}.child_id`;
        },
      },
      type: {
        type: GraphQLString,
      },
      createdAt: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['created_at'],
        resolve: (mangaRelation) => mangaRelation.created_at,
      },
    };
  },
});

export default MangaRelation;
