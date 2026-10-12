import 'package:flutter_test/flutter_test.dart';
import 'package:ios_app/main.dart';

void main() {
  testWidgets('App renders HomeOverviewTab and checklist', (WidgetTester tester) async {
    await tester.pumpWidget(const IOSFlutterApp());

    expect(find.text('Experiment 11: iOS Target'), findsOneWidget);
    expect(find.text('iOS Build Target Verified'), findsOneWidget);
    expect(find.text('Step 7 – Test Application Checklist'), findsOneWidget);
  });
}
