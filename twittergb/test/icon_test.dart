import 'dart:io';

import 'package:twittergb/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('icon assets test', () {
    expect(File(Icon.icon).existsSync(), true);
  });
}
