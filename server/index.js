require('dotenv').config();
const express = require('express');
const { Pool } = require('pg');
const cookieParser = require('cookie-parser');
const registerRoute = require('./routes/register');
const loginRoute = require('./routes/login');

const app = express();
const pool = new Pool({
  user: process.env.DATABASE_USER,
  host: process.env.DATABASE_HOST,
  database: process.env.DATABASE_NAME,
  password: process.env.DATABASE_PASSWORD,
  port: process.env.DATABASE_PORT,
});

const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use(cookieParser());

app.use('/register', registerRoute(pool));
app.use('/login', loginRoute(pool));

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
