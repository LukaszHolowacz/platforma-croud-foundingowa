import 'package:flutter/material.dart';

class BasicInformationAboutProject extends StatelessWidget {
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
              'Podstawowe informacje',
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
            'Tytuł',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 4),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              // Handle help action
            },
            child: const Text(
              'Jakie informacje powinien zawierać tytuł?',
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
            'Kategoria',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: ['Gry'].map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (newValue) {},
          ),
          const SizedBox(height: 16),
          const Text(
            'Podkategoria',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: ['Gry'].map((String subcategory) {
              return DropdownMenuItem<String>(
                value: subcategory,
                child: Text(subcategory),
              );
            }).toList(),
            onChanged: (newValue) {},
          ),
          const SizedBox(height: 48),
          const Text(
            'Wstaw zdjęcie',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              // Handle image selection
            },
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo, color: Colors.grey, size: 50),
                    SizedBox(height: 8),
                    Text(
                      'Wybierz zdjęcie',
                      style: TextStyle(
                          color: Color.fromARGB(255, 70, 70, 70), fontSize: 16),
                    ),
                    Text(
                      'Zdjęcie musi być w formacie JPG, PNG, GIF lub WEBP, nie może większe niż 20MB',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Wstaw wideo projektu (opcjonalne)',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              // Handle image selection
            },
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.movie_creation, color: Colors.grey, size: 50),
                    SizedBox(height: 8),
                    Text(
                      'Wybierz film',
                      style: TextStyle(
                          color: Color.fromARGB(255, 70, 70, 70), fontSize: 16),
                    ),
                    Text(
                      'Film musi być w formacie Mov, MPEG, AVI, MP4, 3GP, WMV lub FLV, nie może większe niż 2560MB',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 48),
          const Text(
            'Ustaw cel',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 4),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixText: 'PLN',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 4),
          const Text(
            'Kalkulator celu, oblicz jak ustawić cel.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 48),
          const Text(
            'Czas zbiórki środków',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<int>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: [30, 45, 60, 75, 90].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('$value dni'),
              );
            }).toList(),
            onChanged: (newValue) {
              // Handle the change if needed
            },
          ),
          const SizedBox(height: 16),
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
