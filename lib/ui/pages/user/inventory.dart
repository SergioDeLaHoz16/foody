import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foody/domain/models/item.dart';
import 'package:foody/ui/pages/product/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InventoryScreen extends StatefulWidget {
  final List<Item> inventory; // Define el parámetro inventory

  const InventoryScreen({Key? key, required this.inventory}) : super(key: key);

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  late List<Item> _inventory;

  @override
  void initState() {
    super.initState();
    _inventory = List.from(widget
        .inventory); // Inicializa _inventory con una copia modificable de widget.inventory
  }

  Future<void> _saveInventory() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStringList =
        _inventory.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('inventory', jsonStringList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario'),
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
                  return _buildInventoryItemCard(item);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newItem = await Navigator.push<Item>(
            context,
            MaterialPageRoute(builder: (context) => RegistroProductoPage()),
          );
          if (newItem != null) {
            setState(() {
              _inventory.add(newItem);
            });
            await _saveInventory(); // Guardar la lista actualizada
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildInventoryItemCard(Item item) {
    return Container(
      height: 185,
      width: double.infinity,
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.nombre,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Loren ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec purus nec.',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cantidad: ${item.cantidad}/99',
                              style: const TextStyle(fontSize: 15.0),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {});
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
