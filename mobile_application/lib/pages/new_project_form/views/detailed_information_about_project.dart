import 'package:flutter/material.dart';

class DetailedInformationAboutProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Szczegółowe informacje',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 70, 70, 70),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Opis',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          const TextField(
            maxLines: 20,
            decoration: InputDecoration(
              hintText:
                  'Opisz czy będzie zajmował się twój projekt, co będzie ułatwiał lub w jaki sposób będzie funkcjonował.',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              // Handle help action
            },
            child: const Text(
              'Jakie informacje powinien zawierać opis?',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 48),
          const Text(
            'Wyzwania',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText:
                  'Opisz z jakimi wyzwaniami lub trudnościami może spotkać się twój projekt.',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 48),
          const Text(
            'Zarząd',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText:
                  'Wymień i krótko opisz ludzi, którzy zajmują się tym projektem.',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 48),
          const Text(
            'Dodatkowe informacje',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText:
                  'Jeżeli jest coś jeszcze czym chciałbyć się podzielić to miejsce jest właśnie tutaj.',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle save and proceed
                },
                child: const Text('Zapisz i przejdź dalej'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
