import 'package:flutter/material.dart';
import './views/basic_information_about_project.dart';
import './views/detailed_information_about_project.dart';
import './views/project_products.dart';

class CreateProjectPage extends StatefulWidget {
  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  String _selectedPage = 'Podstawowe informacje';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Logo',
              style: TextStyle(color: Colors.blue),
            ),
            IconButton(
              icon: const Icon(Icons.visibility, color: Colors.black),
              onPressed: () {
                // Handle preview action
              },
            ),
          ],
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  border: OutlineInputBorder(),
                ),
                value: _selectedPage,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPage = newValue!;
                  });
                },
                items: <String>[
                  'Podstawowe informacje',
                  'Dodatkowe informacje',
                  'Produkty'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(value),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Divider(height: 1, color: Colors.grey),
            _getPageWidget(_selectedPage),
          ],
        ),
      ),
    );
  }

  Widget _getPageWidget(String page) {
    switch (page) {
      case 'Podstawowe informacje':
        return BasicInformationAboutProject();
      case 'Dodatkowe informacje':
        return DetailedInformationAboutProject();
      case 'Produkty':
        return ProjectProducts();
      default:
        return BasicInformationAboutProject();
    }
  }
}
