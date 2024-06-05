import 'package:flutter/material.dart';
import 'create_project_page.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String? selectedCategory;
  String? selectedSubcategory;
  List<String> subcategories = [];

  final Map<String, List<String>> categorySubcategories = {
    'Kategoria 1': ['Podkategoria 1-1', 'Podkategoria 1-2', 'Podkategoria 1-3'],
    'Kategoria 2': ['Podkategoria 2-1', 'Podkategoria 2-2', 'Podkategoria 2-3'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'W jakiej kategorii znajduje się twój biznes?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 70, 70, 70),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              DropdownButton<String>(
                items: categorySubcategories.keys.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedCategory = value;
                    subcategories = categorySubcategories[value] ?? [];
                    selectedSubcategory = null;
                  });
                },
                hint: const Text('Wybierz kategorię'),
                value: selectedCategory,
              ),
              const SizedBox(height: 20),
              if (selectedCategory != null && subcategories.isNotEmpty) ...[
                DropdownButton<String>(
                  items: subcategories.map((String subcategory) {
                    return DropdownMenuItem<String>(
                      value: subcategory,
                      child: Text(subcategory),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedSubcategory = value;
                    });
                  },
                  hint: const Text('Wybierz podkategorię'),
                  value: selectedSubcategory,
                ),
                const SizedBox(height: 20),
              ],
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateProjectPage()),
                  );
                },
                child: const Text('Przejdź dalej'),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
