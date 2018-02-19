import {
  GraphQLID,
  GraphQLNonNull,
  GraphQLString,
} from 'graphql';
import { expect } from 'chai';

import person from '../../api/schemas/queries/getPersonById';

const personType = person.type;

describe('Person', () => {
  it('Should have an id field of type GraphQLID', () => {
    expect(personType.getFields()).to.have.property('id');
    expect(personType.getFields().id.type).to.deep.equals(new GraphQLNonNull(GraphQLID));
  });

  it('Should have an malId field of type GraphQLID', () => {
    expect(personType.getFields()).to.have.property('malId');
    expect(personType.getFields().malId.type).to.deep.equals(new GraphQLNonNull(GraphQLID));
  });

  it('Should have an name field of type GraphQLString', () => {
    expect(personType.getFields()).to.have.property('firstName');
    expect(personType.getFields().firstName.type).to.deep.equals(new GraphQLNonNull(GraphQLString));
  });
});
