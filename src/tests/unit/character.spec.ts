import {
  GraphQLID,
  GraphQLNonNull,
  GraphQLString,
} from 'graphql';
import { expect } from 'chai';

import character from '../../api/schemas/queries/getCharacterById';

const characterType = character.type;

describe('Character', () => {
  it('Should have an id field of type GraphQLID', () => {
    expect(characterType.getFields()).to.have.property('id');
    expect(characterType.getFields().id.type).to.deep.equals(new GraphQLNonNull(GraphQLID));
  });

  it('Should have an malId field of type GraphQLID', () => {
    expect(characterType.getFields()).to.have.property('malId');
    expect(characterType.getFields().malId.type).to.deep.equals(new GraphQLNonNull(GraphQLID));
  });

  it('Should have an name field of type GraphQLString', () => {
    expect(characterType.getFields()).to.have.property('name');
    expect(characterType.getFields().name.type).to.deep.equals(new GraphQLNonNull(GraphQLString));
  });
});
