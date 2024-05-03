import 'package:flutter/material.dart';

class Recent {
  final Image image;
  final String tittle;
  final String description;

  Recent(
      {required this.image, required this.tittle, required this.description});

  void agregarReceta(List<Recent> listRecent) {
    // Implementar lógica para agregar la receta a una lista (lista local o base de datos)
    // Ejemplo usando una lista local
    listRecent.add(this);
    // Notificar a los widgets que la lista ha cambiado (opcional)
    // setState(() {}); // Assuming you're using a StateFulWidget
  }

  void editarReceta(List<Recent> listRecent) {
    // Implementar lógica para editar la receta en la lista o base de datos
    // Ejemplo usando una lista local
    final index = listRecent.indexOf(this);
    if (index != -1) {
      listRecent[index] = this;
      // Notificar a los widgets que la lista ha cambiado (opcional)
      // setState(() {}); // Assuming you're using a StateFulWidget
    }
  }

  void eliminarReceta(List<Recent> listRecent) {
    // Implementar lógica para eliminar la receta de la lista o base de datos
    // Ejemplo usando una lista local
    listRecent.remove(this);
    // Notificar a los widgets que la lista ha cambiado (opcional)
    // setState(() {}); // Assuming you're using a StateFulWidget
  }
}
