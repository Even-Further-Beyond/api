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
});
