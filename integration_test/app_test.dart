import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:meals_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App test', () {
    testWidgets('Testing the meals app', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final str = find.byIcon(Icons.star);

      await tester.tap(str);
      await tester.pumpAndSettle();
      expect(find.text('You have no favourits yet!'), findsOneWidget);
    });
  });
}
