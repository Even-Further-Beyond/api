import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLList,
  GraphQLID,
  GraphQLString,
} from 'graphql';

import Genre from './Genre';
import AnimeImage from './AnimeImage';
import Character from './Character';

const Anime = new GraphQLObjectType({
  name: 'Anime',
  description: 'Object containing anime information',
  ['sqlTable' as string]: 'anime',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: {
        type: new GraphQLNonNull(GraphQLID),
        description: 'The unique ID of the anime',
      },
      malId: {
        type: new GraphQLNonNull(GraphQLID),
        description: 'The unique MAL (MyAnimeList) ID of the anime',
        sqlDeps: ['mal_id'],
        resolve: (anime) => anime.mal_id,
      },
      slug: {
        type: GraphQLString,
        description: 'The unique slug of the anime',
      },
      mainTitle: {
        type: GraphQLString,
        description: 'The main title of the anime used by MAL',
        sqlDeps: ['main_title'],
        resolve: (anime) => anime.main_title,
      },
      englishTitle: {
        type: GraphQLString,
        description: 'The English title of the anime',
        sqlDeps: ['english_title'],
        resolve: (anime) => anime.english_title,
      },
      japaneseTitle: {
        type: GraphQLString,
        description: 'The Japanese title of the anime',
        sqlDeps: ['japanese_title'],
        resolve: (anime) => anime.japanese_title,
      },
      synonyms: {
        type: new GraphQLList(GraphQLString),
        description: 'The other titles the anime might go by',
      },
      seriesType: {
        type: GraphQLString,
        description: 'The series type (TV, ONA, OVA, Movie, Special)',
        sqlDeps: ['series_type'],
        resolve: (anime) => anime.series_type,
      },
      episodes: {
        type: GraphQLString,
        description: 'The episode count number of the anime',
      },
      status: {
        type: GraphQLString,
        description: 'The airing status of the anime (Not yet aired, Currently Airing, Finished Airing)',
      },
      aired: {
        type: GraphQLString,
        description: 'The date or time frame for which this anime aired (Ex: Apr 3, 1998 to Apr 24, 1999)',
      },
      premiered: {
        type: GraphQLString,
        description: 'The season in which this anime premiered (Ex: Spring 1998)',
      },
      producers: {
        type: new GraphQLList(GraphQLString),
        description: 'The producers involved in the making of anime',
      },
      licensors: {
        type: new GraphQLList(GraphQLString),
        description: 'The licensors of the anime',
      },
      studios: {
        type: new GraphQLList(GraphQLString),
        description: 'The studios involved in the making of this anime',
      },
      sourceType: {
        type: GraphQLString,
        description: 'The source type of the anime (Original, Manga, Light novel, Novel, Game)',
        sqlDeps: ['source_type'],
        resolve: (anime) => anime.source_type,
      },
      duration: {
        type: GraphQLString,
        description: 'The duration of each episode of the anime',
      },
      contentRating: {
        type: GraphQLString,
        description: 'The content rating of the anime (Nonem, PG, G, PG-13, R-17+, R+, Rx)',
        sqlDeps: ['content_rating'],
        resolve: (anime) => anime.content_rating,
      },
      synopsis: {
        type: GraphQLString,
        description: 'The synopsis of the anime',
      },
      genres: {
        type: new GraphQLList(Genre),
        description: 'The genres of the anime',
        junction: {
          sqlTable: 'anime_genres',
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
        description: 'The characters that appear in this anime',
        junction: {
          sqlTable: 'characters_anime',
          sqlJoins: [
            (animeTable, charactersAnimeTable) =>
              `${animeTable}.id = ${charactersAnimeTable}.anime_id`,
            (charactersAnimeTable, charactersTable) =>
              `${charactersAnimeTable}.character_id = ${charactersTable}.id`,
          ],
        },
      },
      image: {
        type: AnimeImage,
        description: 'The default image of the anime used by MAL',
        sqlJoin(animeTable, animeImagesTable) {
          return `${animeImagesTable}.id = ${animeTable}.image_id`;
        },
      },
      images: {
        type: new GraphQLList(AnimeImage),
        description: 'The other images of the anime used on MAL',
        sqlJoin(animeTable, animeImagesTable) {
          return `${animeImagesTable}.anime_id = ${animeTable}.id`;
        },
      },
      createdAt: {
        type: GraphQLString,
        description: 'The creation date for this anime record (internal use)',
        sqlDeps: ['created_at'],
        resolve: (anime) => anime.created_at,
      },
      updatedAt: {
        type: GraphQLString,
        description: 'The last updated date for this anime record (internal use)',
        sqlDeps: ['updated_at'],
        resolve: (anime) => anime.updated_at,
      },
    };
  },
});

export default Anime;
