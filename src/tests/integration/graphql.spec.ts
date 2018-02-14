import { expect } from 'chai';

import integrationServer from '../../utils/integrationServer';

describe('Integration', () => {
  let app;

  before((done) => {
    app = integrationServer.start(done);
  });

  after((done) => {
    integrationServer.stop(app, done);
  });

  it('Should resolve a character', () => {
    const query = `{
      character(id: 1) {
        id
        malId
        name
      }
    }`;

    const expected = {
      character: {
        id: '1',
        malId: '1',
        name: 'Spike Spiegel',
      },
    };

    return integrationServer
      .graphqlQuery(query)
      .then((response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.body.data).to.have.deep.equals(expected);
      });
  });

  it('Should resolve an anime', () => {
    const query = `{
      anime(id: 1) {
        id
        malId
        mainTitle
      }
    }`;

    const expected = {
      anime: {
        id: '1',
        malId: '1',
        mainTitle: 'Cowboy Bebop',
      },
    };

    return integrationServer
      .graphqlQuery(query)
      .then((response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.body.data).to.have.deep.equals(expected);
      });
  });

  it('Should resolve a manga', () => {
    const query = `{
      manga(id: 1) {
        id
        malId
        mainTitle
      }
    }`;

    const expected = {
      manga: {
        id: '1',
        malId: '1',
        mainTitle: 'Monster',
      },
    };

    return integrationServer
      .graphqlQuery(query)
      .then((response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.body.data).to.have.deep.equals(expected);
      });
  });

  it('Should resolve a person', () => {
    const query = `{
      person(id: 1) {
        id
        malId
        firstName
      }
    }`;

    const expected = {
      person: {
        id: '1',
        malId: '1',
        firstName: 'Tomokazu',
      },
    };

    return integrationServer
      .graphqlQuery(query)
      .then((response) => {
        expect(response.statusCode).to.equal(200);
        expect(response.body.data).to.have.deep.equals(expected);
      });
  });
});
