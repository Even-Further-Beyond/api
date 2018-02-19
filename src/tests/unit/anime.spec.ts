import {
  GraphQLID,
  GraphQLNonNull,
  GraphQLString,
} from 'graphql';
import { expect } from 'chai';

import anime from '../../api/schemas/queries/getAnimeById';

const animeType = anime.type;

describe('Anime', () => {
  it('Should have an id field of type GraphQLID', () => {
    expect(animeType.getFields()).to.have.property('id');
    expect(animeType.getFields().id.type).to.deep.equals(new GraphQLNonNull(GraphQLID));
  });

  it('Should have an malId field of type GraphQLID', () => {
    expect(animeType.getFields()).to.have.property('malId');
    expect(animeType.getFields().malId.type).to.deep.equals(new GraphQLNonNull(GraphQLID));
  });

  it('Should have an mainTitle field of type GraphQLString', () => {
    expect(animeType.getFields()).to.have.property('mainTitle');
    expect(animeType.getFields().mainTitle.type).to.deep.equals(GraphQLString);
  });
});
