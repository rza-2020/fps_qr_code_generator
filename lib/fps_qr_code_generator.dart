import 'package:flutter/cupertino.dart';
import 'package:fps_qr_code_generator/src/generator.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'fps_qr_code_generator.dart';
import 'fps_qr_code_generator_platform_interface.dart';

export 'package:fps_qr_code_generator/src/models/emv.dart';

class FpsQrCodeGenerator {
  Future<String?> getPlatformVersion() {
    return FpsQrCodeGeneratorPlatform.instance.getPlatformVersion();
  }

  String generateQrCodeString(EMV emv) {
    Generator generator = Generator();
    String qrCodeString = generator.generate(emv);
    return qrCodeString;
  }

  Widget generateQrCodeImage(EMV emv) {
    String qrCodeString = generateQrCodeString(emv);
    return QrImageView(data: qrCodeString);
  }
}