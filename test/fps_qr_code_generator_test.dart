import 'package:flutter_test/flutter_test.dart';
import 'package:fps_qr_code_generator/fps_qr_code_generator.dart';
import 'package:fps_qr_code_generator/fps_qr_code_generator_platform_interface.dart';
import 'package:fps_qr_code_generator/fps_qr_code_generator_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFpsQrCodeGeneratorPlatform
    with MockPlatformInterfaceMixin
    implements FpsQrCodeGeneratorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FpsQrCodeGeneratorPlatform initialPlatform = FpsQrCodeGeneratorPlatform.instance;

  test('$MethodChannelFpsQrCodeGenerator is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFpsQrCodeGenerator>());
  });

  test('getPlatformVersion', () async {
    FpsQrCodeGenerator fpsQrCodeGeneratorPlugin = FpsQrCodeGenerator();
    MockFpsQrCodeGeneratorPlatform fakePlatform = MockFpsQrCodeGeneratorPlatform();
    FpsQrCodeGeneratorPlatform.instance = fakePlatform;

    expect(await fpsQrCodeGeneratorPlugin.getPlatformVersion(), '42');
  });
}
