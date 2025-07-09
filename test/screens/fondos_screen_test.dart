import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_funds_app/app.dart';

void main() {
  testWidgets('flujo de suscripción desde FondosScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();

    expect(find.text('Fondos disponibles'), findsOneWidget);
    expect(find.textContaining('BTG'), findsWidgets);

    // Tap en el primer botón "Suscribirse"
    final suscribirseButton = find.widgetWithText(ElevatedButton, 'Suscribirse').first;
    await tester.tap(suscribirseButton);
    await tester.pumpAndSettle();

    // Estamos en la pantalla de Suscripción
    expect(find.textContaining('Suscribirse a'), findsOneWidget);

    // Tap en la opción Email
    await tester.tap(find.text('Email'));
    await tester.pump();

    // Confirmar suscripción
    await tester.tap(find.widgetWithText(ElevatedButton, 'Confirmar suscripción'));
    await tester.pumpAndSettle();

    // Verifica que volvimos a FondosScreen
    expect(find.text('Fondos disponibles'), findsOneWidget);

    // Verifica que se mostró el SnackBar
    expect(find.textContaining('Suscripción exitosa'), findsOneWidget);
  });
}
