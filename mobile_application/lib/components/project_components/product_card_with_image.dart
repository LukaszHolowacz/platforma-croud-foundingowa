import 'package:flutter/material.dart';
import '../../pages/login_page.dart';

class ProductCardWithImage extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String description;

  ProductCardWithImage({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  @override
  _ProductCardWithImageState createState() => _ProductCardWithImageState();
}

class _ProductCardWithImageState extends State<ProductCardWithImage> {
  bool showImage = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        setState(() {
          showImage = !showImage;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                showImage
                    ? Container(
                        height: 150,
                        color: Colors.grey[300],
                        child: Center(
                          child: widget.imageUrl.isNotEmpty
                              ? Image.asset(widget.imageUrl)
                              : const Icon(Icons.image, size: 50),
                        ),
                      )
                    : Text(widget.description),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Wybierz produkt'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
