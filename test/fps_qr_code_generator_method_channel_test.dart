import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fps_qr_code_generator/fps_qr_code_generator_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFpsQrCodeGenerator platform = MethodChannelFpsQrCodeGenerator();
  const MethodChannel channel = MethodChannel('fps_qr_code_generator');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
