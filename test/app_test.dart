import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_funds_app/app.dart';

void main() {
  testWidgets('La app se lanza y muestra pantalla de fondos', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();

    expect(find.text('Fondos disponibles'), findsOneWidget);
  });
}
