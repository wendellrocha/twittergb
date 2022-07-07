import 'dart:io';

import 'package:twittergb/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.camera).existsSync(), true);
    expect(File(Images.conversation).existsSync(), true);
    expect(File(Images.createAccount).existsSync(), true);
    expect(File(Images.error).existsSync(), true);
    expect(File(Images.forgotPassword).existsSync(), true);
    expect(File(Images.gallery).existsSync(), true);
    expect(File(Images.login).existsSync(), true);
    expect(File(Images.noData).existsSync(), true);
    expect(File(Images.ok).existsSync(), true);
    expect(File(Images.post).existsSync(), true);
    expect(File(Images.profileAvatar).existsSync(), true);
    expect(File(Images.profile).existsSync(), true);
  });
}
