import 'package:flutter/material.dart';

class InventoryScreen extends StatefulWidget {
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final _inventory = [
    Item('Brocoli', 1, 3, Image.asset('assets/assets/images/imageFruit.png')),
    Item('Tomate', 1, 3, Image.asset('assets/assets/images/imageFruit.png')),
    Item('Brocoli', 2, 3, Image.asset('assets/assets/images/imageFruit.png')),
    Item('Brocoli', 3, 3, Image.asset('assets/assets/images/imageFruit.png')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            SizedBox(width: 8), // Espacio entre el icono y el texto
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Inventario',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _inventory.length,
                itemBuilder: (context, index) {
                  final item = _inventory[index];
                  return InventoryItemCard(item: item);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement functionality to add a new item
          // ...
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class Item {
  final String name;
  int quantity;
  final int total;
  final Image imageUrl;

  Item(this.name, this.quantity, this.total, this.imageUrl);
}

class InventoryItemCard extends StatefulWidget {
  final Item item;

  InventoryItemCard({Key? key, required this.item}) : super(key: key);

  @override
  _InventoryItemCardState createState() => _InventoryItemCardState();
}

class _InventoryItemCardState extends State<InventoryItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185, // Altura deseada de la tarjeta
      width: double
          .infinity, // Ancho deseado de la tarjeta (toma todo el ancho disponible)
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Mostrar la imagen usando Image.asset en lugar de Image.network
                  widget.item.imageUrl,
                  const SizedBox(width: 10.0),
                  Expanded(
                    // Wrap the description column in Expanded
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.name,
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        // Description within SizedBox with limited width
                        const SizedBox(
                          width:
                              double.infinity, // Take maximum available width
                          child: Text(
                            //widget.item.description,
                            'Loren ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec purus nec.',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cantidad: ${widget.item.quantity}/${widget.item.total}',
                              style: const TextStyle(fontSize: 15.0),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                // Incrementar la cantidad
                                setState(() {
                                  widget.item.quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
