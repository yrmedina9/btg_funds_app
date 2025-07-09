enum CategoriaFondo { FPV, FIC }

class Fondo {
  final int id;
  final String nombre;
  final int montoMinimo;
  final CategoriaFondo categoria;

  const Fondo({
    required this.id,
    required this.nombre,
    required this.montoMinimo,
    required this.categoria,
  });

  factory Fondo.fromJson(Map<String, dynamic> json) {
    return Fondo(
      id: json['id'],
      nombre: json['nombre'],
      montoMinimo: json['montoMinimo'],
      categoria: json['categoria'] == 'FPV' ? CategoriaFondo.FPV : CategoriaFondo.FIC,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'montoMinimo': montoMinimo,
      'categoria': categoria.name,
    };
  }
}
