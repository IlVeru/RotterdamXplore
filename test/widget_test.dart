import 'package:flutter_test/flutter_test.dart';
import 'package:rotterdamxplore/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RotterdamXploreApp());

    // Verify that our app name is in the appbar.
    expect(find.text('RotterdamXplore'), findsWidgets);
  });
}
