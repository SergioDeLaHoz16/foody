import 'package:flutter/material.dart';
import 'package:foody/domain/models/item.dart';
import 'package:foody/ui/pages/user/inventory.dart';

class RegistroProductoPage extends StatefulWidget {
  @override
  _RegistroProductoPageState createState() => _RegistroProductoPageState();
}

class _RegistroProductoPageState extends State<RegistroProductoPage> {
  String _selectedTipo = 'Vegetales'; // Tipo por defecto

  // Lista de tipos disponibles
  List<String> _tipos = [
    'Vegetales',
    'Frutas',
    'Harinas',
    'Pescados',
    'Carnes',
    'Lácteos',
    'Cereales',
    'Legumbres',
    'Bebidas'
  ];

  TextEditingController _nombreController = TextEditingController();
  TextEditingController _descripcionController = TextEditingController();
  TextEditingController _cantidadController = TextEditingController();
  TextEditingController _fechaIngresoController = TextEditingController();
  TextEditingController _fechaVencimientoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildDropdownTipo(),
            _buildTextField(_nombreController, 'Nombre'),
            _buildTextField(_descripcionController, 'Descripción'),
            _buildTextField(_cantidadController, 'Cantidad'),
            _buildTextField(_fechaIngresoController, 'Fecha de Ingreso'),
            _buildTextField(
                _fechaVencimientoController, 'Fecha de Vencimiento'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitRegistro,
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownTipo() {
    return DropdownButtonFormField<String>(
      value: _selectedTipo,
      onChanged: (newValue) {
        setState(() {
          _selectedTipo = newValue!;
        });
      },
      items: _tipos.map((tipo) {
        return DropdownMenuItem<String>(
          value: tipo,
          child: Text(tipo),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: 'Tipo',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void _submitRegistro() {
    // Obtiene los valores de los controladores
    String nombre = _nombreController.text;
    String descripcion = _descripcionController.text;
    int cantidad = int.tryParse(_cantidadController.text) ?? 0;
    String fechaIngreso = _fechaIngresoController.text;
    String fechaVencimiento = _fechaVencimientoController.text;
    String tipo = _selectedTipo;

    // Crea un objeto Item con los datos del producto
    Item producto = Item(
      nombre: nombre,
      descripcion: descripcion,
      cantidad: cantidad,
      fechaIngreso: fechaIngreso,
      fechaVencimiento: fechaVencimiento,
      tipo: tipo,
    );

    // Cierra la pantalla actual y vuelve al InventoryScreen con el nuevo producto
    Navigator.pop(context, producto);
  }
}
