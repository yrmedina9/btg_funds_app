import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:btg_funds_app/core/models/fondo_model.dart';
import 'package:btg_funds_app/presentation/widgets/fondo-card/fondo_card.dart';

void main() {
  testWidgets('FondoCard muestra datos correctamente', (tester) async {
    final fondo = Fondo(
      id: 1,
      nombre: 'Fondo Ejemplo',
      montoMinimo: 100000,
      categoria: CategoriaFondo.FPV,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FondoCard(fondo: fondo),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Fondo Ejemplo'), findsOneWidget);
    expect(find.textContaining('Monto mínimo'), findsOneWidget);
    expect(find.textContaining('Categoría'), findsOneWidget);
    expect(find.text('Suscribirse'), findsOneWidget);
  });
}
