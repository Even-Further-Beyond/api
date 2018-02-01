import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLString,
} from 'graphql';

import Anime from '../../anime';

const AnimeRelation = new GraphQLObjectType({
  name: 'AnimeRelation',
  description: 'Object containing anime relation information',
  ['sqlTable' as string]: 'anime_relation',
  ['uniqueKey' as string]: ['parent_id', 'child_id', 'type'],
  fields: () => {
    return {
      anime: {
        type: Anime,
        sqlJoin(animeRelationTable, animeTable) {
          return `${animeTable}.id = ${animeRelationTable}.child_id`;
        },
      },
      type: {
        type: GraphQLString,
      },
      createdAt: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['created_at'],
        resolve: (animeRelation) => animeRelation.created_at,
      },
    };
  },
});

export default AnimeRelation;
