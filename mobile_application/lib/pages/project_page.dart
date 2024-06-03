import 'package:flutter/material.dart';
import '../components/project_components/product_card.dart';
import 'login_page.dart';

class ProjectPage extends StatefulWidget {
  final int projectNumber;

  ProjectPage({required this.projectNumber});

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  String selectedSection = 'Produkty';
  final TextEditingController _controller = TextEditingController(text: '20');

  @override
  Widget build(BuildContext context) {
    final String productName = 'Nazwa produktu';
    final double price = 100.0;
    final int remainingQuantity = 7;
    final int startingQuantity = 500;
    final int supporters = 312;
    final String description =
        'Opis, który będzie mógł wyglądać na różne sposoby:\n'
        '- Może\n- być\n- listą\n- punktowaną\n'
        'Może być również pogrubiony, pochylony lub przekreślony.\n\n'
        'Może być powiększony\n'
        'i to wszystko będzie odczytywane z bazy danych';
    final String deliveryDate = 'Wrzesień 2024';
    final String deliveryMethod = 'Dostawa do paczkomatu';
    final double deliveryCost = 20.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nazwa projektu nr: ${widget.projectNumber}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 32,
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.image, size: 100)),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(
                    value: 0.2,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('20%'),
                      Text('100 000zł z 500 000zł'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildSectionButton('Produkty'),
                    buildSectionButton('Opis Projektu'),
                    buildSectionButton('Powody do inwestycji'),
                    buildSectionButton('Ryzyka'),
                    buildSectionButton('Zarząd'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Kwota wsparcia',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Wesprzyj'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              if (selectedSection == 'Produkty') ...[
                const Center(
                  child: Text(
                    'Oferta dla inwestorów',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                ProductCard(
                  productName: productName,
                  price: price,
                  remainingQuantity: remainingQuantity,
                  startingQuantity: startingQuantity,
                  supporters: supporters,
                  description: description,
                  deliveryDate: deliveryDate,
                  deliveryMethod: deliveryMethod,
                  deliveryCost: deliveryCost,
                ),
                ProductCard(
                  productName: productName,
                  price: 150.0,
                  remainingQuantity: 5,
                  startingQuantity: 250,
                  supporters: supporters,
                  description: description,
                  deliveryDate: deliveryDate,
                  deliveryMethod: deliveryMethod,
                  deliveryCost: 0,
                ),
                ProductCard(
                  productName: productName,
                  price: 250.0,
                  remainingQuantity: 0,
                  startingQuantity: 100,
                  supporters: supporters,
                  description: description,
                  deliveryDate: deliveryDate,
                  deliveryMethod: deliveryMethod,
                  deliveryCost: 25,
                ),
              ] else ...[
                Center(
                  child: Text(
                    selectedSection,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Treść dla sekcji: $selectedSection'),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedSection = title;
          });
        },
        child: Text(title),
        style: ElevatedButton.styleFrom(
          primary: selectedSection == title ? Colors.blue[800] : Colors.blue,
        ),
      ),
    );
  }
}
