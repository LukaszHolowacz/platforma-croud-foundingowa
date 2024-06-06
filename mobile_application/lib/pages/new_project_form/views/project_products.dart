import 'package:flutter/material.dart';

class ProjectProducts extends StatelessWidget {
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
              'Produkty',
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
            'Dodaj produkty (nagrody), które będziesz oferował za wsparcie. Mogą być to unikalne doświadczenia, produkt fizyczny lub produkt elektroniczny, ale każdy z nich musi oferować jakąś wartość dla użytkownika.',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 70, 70, 70),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle add new product
                },
                child: const Text('+ Dodaj nowy produkt'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
