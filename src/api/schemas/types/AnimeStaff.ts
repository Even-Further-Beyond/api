import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLString,
} from 'graphql';

import Anime from './Anime';
import Person from './Person';

const AnimeStaff = new GraphQLObjectType({
  name: 'AnimeStaff',
  description: 'Object containing anime staff information',
  ['sqlTable' as string]: 'anime_staff',
  ['uniqueKey' as string]: ['anime_id', 'person_id', 'role'],
  fields: () => {
    return {
      anime: {
        type: Anime,
        sqlJoin(animeStaffTable, animeTable) {
          return `${animeTable}.id = ${animeStaffTable}.anime_id`;
        },
      },
      person: {
        type: Person,
        sqlJoin(animeStaffTable, personTable) {
          return `${personTable}.id = ${animeStaffTable}.person_id`;
        },
      },
      role: {
        type: GraphQLString,
      },
      createdAt: {
        type: new GraphQLNonNull(GraphQLString),
        sqlDeps: ['created_at'],
        resolve: (animeStaff) => animeStaff.created_at,
      },
    };
  },
});

export default AnimeStaff;
