import 'package:flutter_test/flutter_test.dart';
import 'package:nicher/main.dart';

void main() {
  testWidgets('renders login options', (WidgetTester tester) async {
    await tester.pumpWidget(const NicherApp());

    expect(find.text('Nastavi s Instagramom'), findsOneWidget);
    expect(find.text('Nastavi s TikTokom'), findsOneWidget);
  });
}
