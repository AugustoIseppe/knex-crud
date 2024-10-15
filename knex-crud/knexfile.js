import 'dotenv/config';

let { DB_HOST, DB_DATABASE, DB_USER, DB_PASSWORD, DB_CLIENT } = process.env;


/**
 * @type { Object.<string, import("knex").Knex.Config> }
 */

export default {
  client: process.env.DB_CLIENT, // 'mysql2'
  connection: {
    host: process.env.DB_HOST, // 'localhost'
    database: process.env.DB_DATABASE, // 'crud'
    user: process.env.DB_USER, // 'root'
    password: process.env.DB_PASSWORD // '*1992%A1i9b292$'
  }
};
