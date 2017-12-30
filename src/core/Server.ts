import * as express from 'express';
import * as http from 'http';

import Logger from './Logger';

export default class Server {
  private logger: Logger;

  constructor(logger: Logger) {
    this.logger = logger;
  }

  public init(): express.Application {
    return express();
  }

  public run(app: express.Application, port: string): http.Server {
    const server = app.listen(this.normalizePort(port));
    server.on('listening', () => this.onListening(server));
    server.on('error', (error) => this.onError(server, error));
    return server;
  }

  private normalizePort(port: string): number | string | boolean {
    const parsedPort = parseInt(port, 10);
    if (isNaN(parsedPort)) {
      return port;
    }
    if (parsedPort >= 0) {
      return parsedPort;
    }

    return false;
  }

  private onListening(server: http.Server): void {
    this.logger.debug(`Listening on ${this.bind(server.address())}`);
  }

  private onError(server: http.Server, error: Error): void {
    if (error['syscall'] !== 'listen') {
      throw error;
    }
    const addr = server.address();
    switch (error['code']) {
      case 'EACESS':
        this.logger.error(`${this.bind(addr)} requires elevated privileges`);
        process.exit(1);
        break;
      case 'EADDRINUSE':
        this.logger.error(`${this.bind(addr)} is already in use`);
        process.exit(1);
        break;
      default:
        throw error;
    }
  }

  private bind(addr: string | any): string {
    return typeof addr === 'string'
      ? `pipe ${addr}`
      : `port ${addr.port}`;
  }
}
