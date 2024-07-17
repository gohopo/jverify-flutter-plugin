// ignore_for_file: unused_import

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jverify/jverify.dart';

void main() {
  const MethodChannel channel = MethodChannel('jverify');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
  });
}
