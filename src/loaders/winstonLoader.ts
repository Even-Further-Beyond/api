import { MicroframeworkSettings, MicroframeworkLoader } from 'microframework';
import * as winston from 'winston';
import * as moment from 'moment';

import Environment from '../core/Environment';

const winstonLoader: MicroframeworkLoader = (settings: MicroframeworkSettings | undefined) => {
  winston.configure({
    transports: [
      new winston.transports.Console({
        level: Environment.log.level,
        handleExceptions: true,
        json: Environment.log.json,
        timestamp: () => moment().format('YYYY-MM-DD HH:mm:ss.SSSS'),
        colorize: Environment.isDevelopment,
      }),
    ],
  });
};

export default winstonLoader;
