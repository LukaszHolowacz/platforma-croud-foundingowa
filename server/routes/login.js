const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const router = express.Router();
const SECRET_KEY = process.env.SECRET_KEY;

module.exports = (pool) => {
  router.post('/', async (req, res) => {
    const { email, password } = req.body;

    try {
      const userCheck = await pool.query('SELECT * FROM users WHERE email = $1', [email]);
      if (userCheck.rows.length === 0) {
        return res.status(400).json({ message: 'Nieprawidłowy e-mail lub hasło' });
      }

      const user = userCheck.rows[0];
      const isPasswordValid = await bcrypt.compare(password, user.password);
      if (!isPasswordValid) {
        return res.status(400).json({ message: 'Nieprawidłowy e-mail lub hasło' });
      }

      const token = jwt.sign({ userId: user.id }, SECRET_KEY, { expiresIn: '30d' });
      res.cookie('session_token', token, { httpOnly: true, maxAge: 30 * 24 * 60 * 60 * 1000 }); 

      res.status(200).json({ message: 'Zalogowano pomyślnie' });
    } catch (error) {
      res.status(500).json({ message: 'Błąd serwera' });
    }
  });

  return router;
};
