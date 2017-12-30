import {
  GraphQLID,
  GraphQLInt,
  GraphQLList,
  GraphQLNonNull,
  GraphQLObjectType,
  GraphQLString,
  GraphQLFloat,
} from 'graphql';

import Gender from './Gender';
import HairLength from './HairLength';
import AgeGroup from './AgeGroup';
import Color from './Color';
import Anime from './Anime';
import Casting from './Casting';
import Tag from './Tag';
import CharacterImage from './CharacterImage';
import CharacterAnime from './CharacterAnime';

const Character = new GraphQLObjectType({
  name: 'Character',
  description: 'Object containing character information',
  ['sqlTable' as string]: 'characters',
  ['uniqueKey' as string]: 'id',
  fields: () => {
    return {
      id: {
        type: new GraphQLNonNull(GraphQLID),
        description: 'The unique ID of the character',
      },
      malId: {
        type: GraphQLInt,
        description: 'The unique MAL (MyAnimeList) ID of the character',
        sqlDeps: ['mal_id'],
        resolve: (character) => character.mal_id,
      },
      slug: {
        type: new GraphQLNonNull(GraphQLString),
        description: 'The unique slug of the character',
      },
      name: {
        type: new GraphQLNonNull(GraphQLString),
        description: 'The name of the character',
      },
      japaneseName: {
        type: GraphQLString,
        description: 'The Japanese name of the character',
        sqlDeps: ['japanese_name'],
        resolve: (character) => character.japanese_name,
      },
      alternativeNames: {
        type: new GraphQLList(GraphQLString),
        description: 'The alternative names of the character',
        sqlDeps: ['alternative_names'],
        resolve: (character) => character.alternative_names,
      },
      description: {
        type: GraphQLString,
        description: 'The description of the character',
      },
      ageStart: {
        type: GraphQLFloat,
        sqlDeps: ['age_start'],
        resolve: (character) => character.age_start,
      },
      ageEnd: {
        type: GraphQLFloat,
        sqlDeps: ['age_end'],
        resolve: (character) => character.age_end,
      },
      heightStart: {
        type: GraphQLFloat,
        sqlDeps: ['height_start'],
        resolve: (character) => character.height_start,
      },
      heightEnd: {
        type: GraphQLFloat,
        sqlDeps: ['height_end'],
        resolve: (character) => character.height_end,
      },
      weightStart: {
        type: GraphQLFloat,
        sqlDeps: ['weight_start'],
        resolve: (character) => character.weight_start,
      },
      weightEnd: {
        type: GraphQLFloat,
        sqlDeps: ['weight_end'],
        resolve: (character) => character.weight_end,
      },
      gender: {
        type: Gender,
        sqlJoin(charactersTable, gendersTable) {
          return `${gendersTable}.id = ${charactersTable}.gender_id`;
        },
      },
      hairLength: {
        type: HairLength,
        sqlJoin(charactersTable, hairLengthsTable) {
          return `${hairLengthsTable}.id = ${charactersTable}.hair_length_id`;
        },
      },
      ageGroups: {
        type: new GraphQLList(AgeGroup),
        junction: {
          sqlTable: 'characters_age_groups',
          sqlJoins: [
            (charactersTable, charactersAgeGroupsTable) =>
              `${charactersTable}.id = ${charactersAgeGroupsTable}.character_id`,
            (charactersAgeGroupsTable, ageGroupTable) =>
              `${charactersAgeGroupsTable}.age_group_id = ${ageGroupTable}.id`,
          ],
        },
      },
      hairColors: {
        type: new GraphQLList(Color),
        junction: {
          sqlTable: 'characters_hair_colors',
          sqlJoins: [
            (charactersTable, charactersHairColorsTable) =>
              `${charactersTable}.id = ${charactersHairColorsTable}.character_id`,
            (charactersHairColorsTable, colorsTable) =>
              `${charactersHairColorsTable}.color_id = ${colorsTable}.id`,
          ],
        },
      },
      eyeColors: {
        type: new GraphQLList(Color),
        junction: {
          sqlTable: 'characters_eye_colors',
          sqlJoins: [
            (charactersTable, charactersEyeColorsTable) =>
              `${charactersTable}.id = ${charactersEyeColorsTable}.character_id`,
            (charactersEyeColorsTable, colorsTable) =>
              `${charactersEyeColorsTable}.color_id = ${colorsTable}.id`,
          ],
        },
      },
      anime: {
        type: new GraphQLList(Anime),
        junction: {
          sqlTable: 'characters_anime',
          sqlJoins: [
            (charactersTable, charactersAnimeTable) =>
              `${charactersTable}.id = ${charactersAnimeTable}.character_id`,
            (charactersAnimeTable, animeTable) =>
              `${charactersAnimeTable}.anime_id = ${animeTable}.id`,
          ],
        },
      },
      animeAndRoles: {
        type: new GraphQLList(CharacterAnime),
        sqlJoin(charactersTable, animeAndRolesTable) {
          return `${animeAndRolesTable}.character_id = ${charactersTable}.id`;
        },
      },
      tags: {
        type: new GraphQLList(Tag),
        junction: {
          sqlTable: 'characters_tags',
          sqlJoins: [
            (charactersTable, charactersTagsTable) =>
              `${charactersTable}.id = ${charactersTagsTable}.character_id`,
            (charactersTagsTable, tagsTable) =>
              `${charactersTagsTable}.tag_id = ${tagsTable}.id`,
          ],
        },
      },
      image: {
        type: CharacterImage,
        sqlJoin(charactersTable, charactersImagesTable) {
          return `${charactersImagesTable}.id = ${charactersTable}.image_id`;
        },
      },
      images: {
        type: new GraphQLList(CharacterImage),
        sqlJoin(charactersTable, charactersImagesTable) {
          return `${charactersImagesTable}.character_id = ${charactersTable}.id`;
        },
      },
      castings: {
        type: new GraphQLList(Casting),
        sqlJoin(charactersTable, castingsTable) {
          return `${castingsTable}.character_id = ${charactersTable}.id`;
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
