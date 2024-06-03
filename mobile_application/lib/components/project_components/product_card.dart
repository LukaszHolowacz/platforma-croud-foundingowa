import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String productName;
  final double price;
  final int remainingQuantity;
  final int startingQuantity;
  final int supporters;
  final String description;
  final String deliveryDate;
  final String deliveryMethod;
  final double deliveryCost;

  ProductCard({
    required this.productName,
    required this.price,
    required this.remainingQuantity,
    required this.startingQuantity,
    required this.supporters,
    required this.description,
    required this.deliveryDate,
    required this.deliveryMethod,
    required this.deliveryCost,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final TextEditingController _supportController =
      TextEditingController(text: '0');
  double additionalSupport = 0.0;

  void _updateSupport() {
    setState(() {
      additionalSupport = double.tryParse(_supportController.text) ?? 0.0;
    });
  }

  @override
  void initState() {
    super.initState();
    _supportController.addListener(_updateSupport);
  }

  @override
  void dispose() {
    _supportController.removeListener(_updateSupport);
    _supportController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double totalPrice =
        widget.price + widget.deliveryCost + additionalSupport;
    final bool isOutOfStock = widget.remainingQuantity == 0;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.productName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.price.toStringAsFixed(2)}zł',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Center(
                          child: Icon(Icons.image,
                              size: 100, color: Colors.grey[700])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.pink[100],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Pozostało ${widget.remainingQuantity} z ${widget.startingQuantity}',
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Wybrało ${widget.supporters} osób',
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.description,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Szacunkowy czas dostawy:',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey)),
                            Text(widget.deliveryDate,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Forma dostawy:',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey)),
                            Text(widget.deliveryMethod,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 56,
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Dodatkowe wsparcie (opcjonalne)',
                                border: OutlineInputBorder(),
                              ),
                              controller: _supportController,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          height: 56,
                          child: ElevatedButton(
                            onPressed: isOutOfStock ? null : () {},
                            child: Text(
                                'Wesprzyj (${totalPrice.toStringAsFixed(2)}zł)'),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.deliveryCost > 0)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '+ Koszt dostawy: ${widget.deliveryCost.toStringAsFixed(2)}zł',
                          style:
                              const TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (isOutOfStock)
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.8),
              child: const Center(
                child: Text(
                  'Wyprzedane',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
