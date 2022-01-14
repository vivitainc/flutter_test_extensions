import 'package:flutter_test/flutter_test.dart';
import 'package:test_extensions/test_extensions.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpBody(() async {
    // setUp
  });
  tearDownBody(() async {
    // tearDown
  });

  test('Example Test', testBody(() async {
    // ignore: avoid_print
    print('OK!');
  }), timeout: const Timeout(Duration(seconds: 10)));
}
