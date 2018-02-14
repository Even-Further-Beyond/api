import {
  GraphQLID,
  GraphQLNonNull,
  GraphQLString,
} from 'graphql';
import { expect } from 'chai';

import manga from '../../api/schemas/queries/manga';

const mangaType = manga.type;

describe('Manga', () => {
  it('Should have an id field of type GraphQLID', () => {
    expect(mangaType.getFields()).to.have.property('id');
    expect(mangaType.getFields().id.type).to.deep.equals(new GraphQLNonNull(GraphQLID));
  });

  it('Should have an malId field of type GraphQLID', () => {
    expect(mangaType.getFields()).to.have.property('malId');
    expect(mangaType.getFields().malId.type).to.deep.equals(new GraphQLNonNull(GraphQLID));
  });

  it('Should have an name field of type GraphQLString', () => {
    expect(mangaType.getFields()).to.have.property('mainTitle');
    expect(mangaType.getFields().mainTitle.type).to.deep.equals(new GraphQLNonNull(GraphQLString));
  });
});
