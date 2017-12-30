
import { bootstrapMicroframework } from 'microframework';

import banner from './core/banner';
import Logger from './core/Logger';

import expressLoader from './loaders/expressLoader';
import winstonLoader from './loaders/winstonLoader';
import objectionLoader from './loaders/objectionLoader';
import graphqlLoader from './loaders/graphqlLoader';

const logger = new Logger(__filename);

bootstrapMicroframework({
  loaders: [
    winstonLoader,
    expressLoader,
    objectionLoader,
    graphqlLoader,
  ],
})
  .then(() => banner(logger))
  .catch(error => logger.error(`Application has crashed: ${error}`));
