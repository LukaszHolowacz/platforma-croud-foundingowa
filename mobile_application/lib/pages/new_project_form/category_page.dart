import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'create_project_page.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String? selectedCategory;
  String? selectedSubcategory;
  List<String> subcategories = [];
  Map<String, List<String>> categorySubcategories = {};

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    final String response =
        await rootBundle.loadString('lib/assets/json/categories.json');
    final data = await json.decode(response);
    Map<String, List<String>> loadedCategories = {};
    for (var category in data['categories']) {
      loadedCategories[category['name']] =
          List<String>.from(category['subcategories']);
    }
    setState(() {
      categorySubcategories = loadedCategories;
    });
  }

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
                'W jakiej kategorii możesz określić swój projekt?',
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
                onPressed: selectedSubcategory == null
                    ? null
                    : () {
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
