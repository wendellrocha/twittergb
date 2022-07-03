import 'dart:io';

import 'package:twittergb/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.noData).existsSync(), true);
  });
}
