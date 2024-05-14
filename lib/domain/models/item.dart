import 'dart:convert';

class Item {
  String nombre;
  String descripcion;
  int cantidad;
  String fechaIngreso;
  String fechaVencimiento;
  String tipo;

  Item({
    required this.nombre,
    required this.descripcion,
    required this.cantidad,
    required this.fechaIngreso,
    required this.fechaVencimiento,
    required this.tipo,
  });

  // Define a factory method to create Item from a JSON object
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      cantidad: json['cantidad'],
      fechaIngreso: json['fechaIngreso'],
      fechaVencimiento: json['fechaVencimiento'],
      tipo: json['tipo'],
    );
  }

  // Define a method to convert Item to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'cantidad': cantidad,
      'fechaIngreso': fechaIngreso,
      'fechaVencimiento': fechaVencimiento,
      'tipo': tipo,
    };
  }
}
