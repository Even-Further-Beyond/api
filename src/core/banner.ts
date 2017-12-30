import Logger from './Logger';
import Environment from './Environment';

export default function banner(log: Logger): void {
  log.info(``);
  log.info(`Your app is ready on ${Environment.app.route}${Environment.app.routePrefix}`);
  log.info(`To shut it down, press <CTRL> + C at any time.`);
  log.info(``);
  log.info('-------------------------------------------------------');
  log.info(`Environment  : ${Environment.node}`);
  log.info(``);
  log.info(`API Info     : ${Environment.app.route}${Environment.app.routePrefix}`);
  log.info(`GraphQL      : ${Environment.app.route}${Environment.graphql.route}`);
  if (Environment.monitor.enabled) {
      log.info(`Monitor      : ${Environment.app.route}${Environment.monitor.route}`);
  }
  log.info('-------------------------------------------------------');
  log.info('');
}
