import {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLList,
  GraphQLID,
  GraphQLInt,
  GraphQLString,
} from 'graphql';

import MangaGenre from './relations/MangaGenre';
import MangaImage from './relations/MangaImage';
import MangaAuthor from './relations/MangaAuthor';
import MangaRelation from './relations/MangaRelation';

import Character from '../character';
import Anime from '../anime';

const Manga = new GraphQLObjectType({
  name: 'Manga',
  description: 'Object containing manga information',
  ['sqlTable' as string]: 'manga',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: {
        type: new GraphQLNonNull(GraphQLID),
      },
      malId: {
        type: new GraphQLNonNull(GraphQLID),
        sqlDeps: ['mal_id'],
        resolve: (manga) => manga.mal_id,
      },
      mainTitle: {
        type: GraphQLString,
        sqlDeps: ['main_title'],
        resolve: (manga) => manga.main_title,
      },
      englishTitle: {
        type: GraphQLString,
        sqlDeps: ['english_title'],
        resolve: (manga) => manga.english_title,
      },
      japaneseTitle: {
        type: GraphQLString,
        sqlDeps: ['japanese_title'],
        resolve: (manga) => manga.japanese_title,
      },
      alternativeTitles: {
        type: new GraphQLList(GraphQLString),
        sqlDeps: ['alternative_titles'],
        resolve: (manga) => manga.alternative_titles,
      },
      synopsis: {
        type: GraphQLString,
      },
      type: {
        type: GraphQLString,
      },
      volumes: {
        type: GraphQLInt,
      },
      chapters: {
        type: GraphQLInt,
      },
      status: {
        type: GraphQLString,
      },
      published: {
        type: GraphQLString,
      },
      serialization: {
        type: GraphQLString,
      },
      image: {
        type: MangaImage,
        sqlJoin(mangaTable, mangaImageTable) {
          return `${mangaImageTable}.id = ${mangaTable}.image_id`;
        },
      },
      genres: {
        type: new GraphQLList(MangaGenre),
        junction: {
          sqlTable: 'manga_manga_genre',
          sqlJoins: [
            (mangaTable, mangaGenreTable) =>
              `${mangaTable}.id = ${mangaGenreTable}.manga_id`,
            (mangaGenreTable, genreTable) =>
              `${mangaGenreTable}.genre_id = ${genreTable}.id`,
          ],
        },
      },
      characters: {
        type: new GraphQLList(Character),
        junction: {
          sqlTable: 'character_manga',
          sqlJoins: [
            (mangaTable, characterMangaTable) =>
              `${mangaTable}.id = ${characterMangaTable}.manga_id`,
            (characterMangaTable, characterTable) =>
              `${characterMangaTable}.character_id = ${characterTable}.id`,
          ],
        },
      },
      authors: {
        type: MangaAuthor,
        sqlJoin(mangaTable, mangaAuthorTable) {
          return `${mangaAuthorTable}.manga_id = ${mangaTable}.id`;
        },
      },
      relations: {
        type: new GraphQLList(MangaRelation),
        sqlJoin(mangaTable, mangRelationTable) {
          return `${mangRelationTable}.parent_id = ${mangaTable}.id`;
        },
      },
      adaptations: {
        type: new GraphQLList(Anime),
        junction: {
          sqlTable: 'adaptation',
          sqlJoins: [
            (mangaTable, adaptationTable) =>
              `${mangaTable}.id = ${adaptationTable}.manga_id`,
            (adaptationTable, animeTable) =>
              `${adaptationTable}.anime_id = ${animeTable}.id`,
          ],
        },
      },
      createdAt: {
        type: GraphQLString,
        sqlDeps: ['updated_at'],
        resolve: (manga) => manga.created_at,
      },
      updatedAt: {
        type: GraphQLString,
        sqlDeps: ['updated_at'],
        resolve: (manga) => manga.updated_at,
      },
    };
  },
});

export default Manga;
