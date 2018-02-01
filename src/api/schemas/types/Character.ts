import {
  GraphQLID,
  GraphQLInt,
  GraphQLList,
  GraphQLNonNull,
  GraphQLObjectType,
  GraphQLString,
} from 'graphql';

import Gender from './Gender';
import HairLength from './HairLength';
import AgeGroup from './AgeGroup';
import Color from './Color';
import Anime from './Anime';
import Casting from './Casting';
import CharacterTag from './CharacterTag';
import CharacterImage from './CharacterImage';
import CharacterAnime from './CharacterAnime';
import CharacterManga from './CharacterManga';
import Manga from './Manga';

const Character = new GraphQLObjectType({
  name: 'Character',
  description: 'Object containing character information',
  ['sqlTable' as string]: 'character',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: {
        type: new GraphQLNonNull(GraphQLID),
      },
      malId: {
        type: GraphQLInt,
        sqlDeps: ['mal_id'],
        resolve: (character) => character.mal_id,
      },
      name: {
        type: new GraphQLNonNull(GraphQLString),
      },
      japaneseName: {
        type: GraphQLString,
        sqlDeps: ['japanese_name'],
        resolve: (character) => character.japanese_name,
      },
      alternativeNames: {
        type: new GraphQLList(GraphQLString),
        sqlDeps: ['alternative_names'],
        resolve: (character) => character.alternative_names,
      },
      description: {
        type: GraphQLString,
      },
      spoilers: {
        type: GraphQLString,
      },
      gender: {
        type: Gender,
        sqlTable: 'gender',
        sqlJoin(characterTable, genderTable) {
          return `${genderTable}.id = ${characterTable}.gender_id`;
        },
      },
      ageGroups: {
        type: new GraphQLList(AgeGroup),
        junction: {
          sqlTable: 'character_age_group',
          sqlJoins: [
            (characterTable, charactersAgeGroupTable) =>
              `${characterTable}.id = ${charactersAgeGroupTable}.character_id`,
            (charactersAgeGroupTable, ageGroupTable) =>
              `${charactersAgeGroupTable}.age_group_id = ${ageGroupTable}.id`,
          ],
        },
      },
      hairLengths: {
        type: HairLength,
        junction: {
          sqlTable: 'character_hair_length',
          sqlJoins: [
            (characterTable, characterHairLengthTable) =>
              `${characterTable}.id = ${characterHairLengthTable}.character_id`,
            (characterHairLengthTable, hairLengthTable) =>
              `${characterHairLengthTable}.hair_length_id = ${hairLengthTable}.id`,
          ],
        },
      },
      hairColors: {
        type: new GraphQLList(Color),
        junction: {
          sqlTable: 'character_hair_color',
          sqlJoins: [
            (characterTable, characterHairColorTable) =>
              `${characterTable}.id = ${characterHairColorTable}.character_id`,
            (characterHairColorTable, colorTable) =>
              `${characterHairColorTable}.hair_color_id = ${colorTable}.id`,
          ],
        },
      },
      eyeColors: {
        type: new GraphQLList(Color),
        junction: {
          sqlTable: 'character_eye_color',
          sqlJoins: [
            (characterTable, characterEyeColorTable) =>
              `${characterTable}.id = ${characterEyeColorTable}.character_id`,
            (characterEyeColorTable, colorTable) =>
              `${characterEyeColorTable}.eye_color_id = ${colorTable}.id`,
          ],
        },
      },
      tags: {
        type: new GraphQLList(CharacterTag),
        junction: {
          sqlTable: 'character_character_tag',
          sqlJoins: [
            (characterTable, characterCharacterTagTable) =>
              `${characterTable}.id = ${characterCharacterTagTable}.character_id`,
            (characterCharacterTagTable, tagTable) =>
              `${characterCharacterTagTable}.tag_id = ${tagTable}.id`,
          ],
        },
      },
      image: {
        type: CharacterImage,
        sqlJoin(characterTable, characterImageTable) {
          return `${characterImageTable}.id = ${characterTable}.image_id`;
        },
      },
      images: {
        type: new GraphQLList(CharacterImage),
        sqlJoin(characterTable, characterImageTable) {
          return `${characterImageTable}.character_id = ${characterTable}.id`;
        },
      },
      anime: {
        type: new GraphQLList(Anime),
        junction: {
          sqlTable: 'character_anime',
          sqlJoins: [
            (characterTable, characterAnimeTable) =>
              `${characterTable}.id = ${characterAnimeTable}.character_id`,
            (characterAnimeTable, animeTable) =>
              `${characterAnimeTable}.anime_id = ${animeTable}.id`,
          ],
        },
      },
      animeAndRoles: {
        type: new GraphQLList(CharacterAnime),
        sqlJoin(characterTable, characterAnimeTable) {
          return `${characterAnimeTable}.character_id = ${characterTable}.id`;
        },
      },
      manga: {
        type: new GraphQLList(Manga),
        junction: {
          sqlTable: 'character_manga',
          sqlJoins: [
            (characterTable, characterMangaTable) =>
              `${characterTable}.id = ${characterMangaTable}.character_id`,
            (characterMangaTable, mangaTable) =>
              `${characterMangaTable}.manga_id = ${mangaTable}.id`,
          ],
        },
      },
      mangaAndRoles: {
        type: new GraphQLList(CharacterManga),
        sqlJoin(characterTable, characterMangaTable) {
          return `${characterMangaTable}.character_id = ${characterTable}.id`;
        },
      },
      castings: {
        type: new GraphQLList(Casting),
        sqlJoin(characterTable, castingTable) {
          return `${castingTable}.character_id = ${characterTable}.id`;
        },
      },
      createdAt: {
        type: GraphQLString,
        sqlDeps: ['created_at'],
        resolve: (character) => character.created_at,
      },
      updatedAt: {
        type: GraphQLString,
        sqlDeps: ['updated_at'],
        resolve: (character) => character.updated_at,
      },
    };
  },
});

export default Character;
