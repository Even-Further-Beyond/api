import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLList,
  GraphQLID,
  GraphQLString,
} from 'graphql';

import AnimeGenre from './relations/AnimeGenre';
import AnimeImage from './relations/AnimeImage';
import AnimeStaff from './relations/AnimeStaff';
import AnimeRelation from './relations/AnimeRelation';

import Character from '../character';
import Manga from '../manga';

import Casting from '../Casting';

const Anime = new GraphQLObjectType({
  name: 'Anime',
  description: 'Object containing anime information',
  ['sqlTable' as string]: 'anime',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: {
        type: new GraphQLNonNull(GraphQLID),
      },
      malId: {
        type: new GraphQLNonNull(GraphQLID),
        description: 'The unique MAL (MyAnimeList) ID of the anime',
        sqlDeps: ['mal_id'],
        resolve: (anime) => anime.mal_id,
      },
      mainTitle: {
        type: GraphQLString,
        sqlDeps: ['main_title'],
        resolve: (anime) => anime.main_title,
      },
      englishTitle: {
        type: GraphQLString,
        sqlDeps: ['english_title'],
        resolve: (anime) => anime.english_title,
      },
      japaneseTitle: {
        type: GraphQLString,
        sqlDeps: ['japanese_title'],
        resolve: (anime) => anime.japanese_title,
      },
      alternativeTitles: {
        type: new GraphQLList(GraphQLString),
        sqlDeps: ['alternative_titles'],
        resolve: (anime) => anime.alternative_titles,
      },
      synopsis: {
        type: GraphQLString,
      },
      spoilers: {
        type: new GraphQLList(GraphQLString),
      },
      type: {
        type: GraphQLString,
        description: '(TV, ONA, OVA, Movie, Special)',
      },
      episodes: {
        type: GraphQLString,
      },
      status: {
        type: GraphQLString,
        description: '(Not yet aired, Currently Airing, Finished Airing)',
      },
      aired: {
        type: GraphQLString,
        description: 'The date or time frame for which this anime aired (Ex: Apr 3, 1998 to Apr 24, 1999)',
      },
      premiered: {
        type: GraphQLString,
        description: 'The season in which this anime premiered (Ex: Spring 1998)',
      },
      broadcast: {
        type: GraphQLString,
        description: 'The day and time when this anime airs (Ex: Wednesdays at 11:30 (JST))',
      },
      producers: {
        type: new GraphQLList(GraphQLString),
      },
      licensors: {
        type: new GraphQLList(GraphQLString),
      },
      studios: {
        type: new GraphQLList(GraphQLString),
      },
      source: {
        type: GraphQLString,
        description: '(Original, Manga, Light novel, Novel, Game)',
      },
      duration: {
        type: GraphQLString,
        description: 'The duration of each episode of the anime',
      },
      contentRating: {
        type: GraphQLString,
        description: '(None, PG, G, PG-13, R-17+, R+, Rx)',
        sqlDeps: ['content_rating'],
        resolve: (anime) => anime.content_rating,
      },
      openings: {
        type: new GraphQLList(GraphQLString),
        description: 'Opening themes of the anime',
      },
      endings: {
        type: new GraphQLList(GraphQLString),
        description: 'Ending themes of the anime',
      },
      image: {
        type: AnimeImage,
        sqlJoin(animeTable, animeImageTable) {
          return `${animeImageTable}.id = ${animeTable}.image_id`;
        },
      },
      genres: {
        type: new GraphQLList(AnimeGenre),
        junction: {
          sqlTable: 'anime_anime_genre',
          sqlJoins: [
            (animeTable, animeGenresTable) =>
              `${animeTable}.id = ${animeGenresTable}.anime_id`,
            (animeGenresTable, genresTable) =>
              `${animeGenresTable}.genre_id = ${genresTable}.id`,
          ],
        },
      },
      characters: {
        type: new GraphQLList(Character),
        junction: {
          sqlTable: 'character_anime',
          sqlJoins: [
            (animeTable, characterAnimeTable) =>
              `${animeTable}.id = ${characterAnimeTable}.anime_id`,
            (characterAnimeTable, characterTable) =>
              `${characterAnimeTable}.character_id = ${characterTable}.id`,
          ],
        },
      },
      staff: {
        type: new GraphQLList(AnimeStaff),
        sqlJoin(animeTable, animeStaffTable) {
          return `${animeStaffTable}.anime_id = ${animeTable}.id`;
        },
      },
      adaptations: {
        type: new GraphQLList(Manga),
        junction: {
          sqlTable: 'adaptation',
          sqlJoins: [
            (animeTable, adaptationTable) =>
              `${animeTable}.id = ${adaptationTable}.anime_id`,
            (adaptationTable, mangaTable) =>
              `${adaptationTable}.manga_id = ${mangaTable}.id`,
          ],
        },
      },
      relations: {
        type: new GraphQLList(AnimeRelation),
        sqlJoin(animeTable, animeRelationTable) {
          return `${animeRelationTable}.parent_id = ${animeTable}.id`;
        },
      },
      castings: {
        type: new GraphQLList(Casting),
        sqlJoin(animeTable, castingTable) {
          return `${castingTable}.anime_id = ${animeTable}.id`;
        },
      },
      createdAt: {
        type: GraphQLString,
        sqlDeps: ['created_at'],
        resolve: (anime) => anime.created_at,
      },
      updatedAt: {
        type: GraphQLString,
        sqlDeps: ['updated_at'],
        resolve: (anime) => anime.updated_at,
      },
    };
  },
});

export default Anime;
