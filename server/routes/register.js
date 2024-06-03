const express = require('express');
const bcrypt = require('bcryptjs');

const router = express.Router();

module.exports = (pool) => {
  router.post('/', async (req, res) => {
    const { email, password, newsletter_accepted = false } = req.body;

    try {
      const userCheck = await pool.query('SELECT * FROM users WHERE email = $1', [email]);
      if (userCheck.rows.length > 0) {
        return res.status(400).json({ message: 'Adres e-mail już istnieje' });
      }

      const hashedPassword = await bcrypt.hash(password, 10);
      await pool.query(
        'INSERT INTO users (email, password, newsletter_accepted, account_created) VALUES ($1, $2, $3, NOW())',
        [email, hashedPassword, newsletter_accepted]
      );

      res.status(201).json({ message: 'Użytkownik zarejestrowany pomyślnie' });
    } catch (error) {
      res.status(500).json({ message: 'Błąd serwera' });
    }
  });

  return router;
};
