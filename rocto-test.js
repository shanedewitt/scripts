const { Pool, Client } = require('pg')
const connectionString = 'postgresql://sdewitt:lilyann@localhost:1337/tvista'
const pool = new Pool({
  connectionString,
})
pool.query('SELECT 1;', (err, res) => {
  console.log(err, res)
  pool.end()
})
const client = new Client({
  connectionString,
})
client.connect()
client.query('SELECT * FROM STATE;', (err, res) => {
  console.log(err, res)
  client.end()
})
