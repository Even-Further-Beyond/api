import { Application } from 'express';
import { createExpressServer } from 'routing-controllers';
import { MicroframeworkSettings, MicroframeworkLoader } from 'microframework';

import Environment from '../core/Environment';

const expressLoader: MicroframeworkLoader = (settings: MicroframeworkSettings | undefined) => {
  if (settings) {
    const expressApp: Application = createExpressServer({
      cors: true,
      classTransformer: true,
      routePrefix: Environment.app.routePrefix,
      defaultErrorHandler: false,
      /**
       * We can add options about how routing-controllers should configure itself.
       * Here we specify what controllers should be registered in our express server.
       */
      middlewares: Environment.app.directories.middlewares,
    });

    // Run application to listen on given port
    if (!Environment.isTest) {
      const server = expressApp.listen(Environment.app.port);
      settings.setData('express_server', server);
    }

    // Here we can set the data for other loaders
    settings.setData('express_app', expressApp);
  }
};

export default expressLoader;
