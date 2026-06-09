import 'package:flutter_test/flutter_test.dart';

import 'package:driver_app/main.dart';

void main() {
  test('WeditDriverApp can be constructed', () {
    const app = WeditDriverApp();
    expect(app, isA<WeditDriverApp>());
  });
}
