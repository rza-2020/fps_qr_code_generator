import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fps_qr_code_generator_method_channel.dart';

abstract class FpsQrCodeGeneratorPlatform extends PlatformInterface {
  /// Constructs a FpsQrCodeGeneratorPlatform.
  FpsQrCodeGeneratorPlatform() : super(token: _token);

  static final Object _token = Object();

  static FpsQrCodeGeneratorPlatform _instance = MethodChannelFpsQrCodeGenerator();

  /// The default instance of [FpsQrCodeGeneratorPlatform] to use.
  ///
  /// Defaults to [MethodChannelFpsQrCodeGenerator].
  static FpsQrCodeGeneratorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FpsQrCodeGeneratorPlatform] when
  /// they register themselves.
  static set instance(FpsQrCodeGeneratorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
