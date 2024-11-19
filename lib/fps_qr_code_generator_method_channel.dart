import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fps_qr_code_generator_platform_interface.dart';

/// An implementation of [FpsQrCodeGeneratorPlatform] that uses method channels.
class MethodChannelFpsQrCodeGenerator extends FpsQrCodeGeneratorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fps_qr_code_generator');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
