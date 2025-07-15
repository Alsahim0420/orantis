// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:orantis/main.dart';

void main() {
  testWidgets('Orantis app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const OrantisApp());

    // Verify that the app title is displayed.
    expect(find.text('Orantis'), findsOneWidget);

    // Verify that welcome text is displayed.
    expect(find.text('Bienvenido a Orantis'), findsOneWidget);
    expect(find.text('Tu compañero de oración'), findsOneWidget);

    // Verify that the prayer buttons are displayed.
    expect(find.text('Rezar el Rosario'), findsOneWidget);
    expect(find.text('Rezar la Coronilla'), findsOneWidget);
  });
}
