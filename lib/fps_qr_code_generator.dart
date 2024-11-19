import 'package:flutter/material.dart';
import 'package:fps_qr_code_generator/src/generator.dart';
import 'package:fps_qr_code_generator/src/widget/qr_code_widget.dart';

import 'fps_qr_code_generator.dart';
import 'fps_qr_code_generator_platform_interface.dart';

export 'package:fps_qr_code_generator/src/models/emv.dart';
export 'package:qr_flutter/qr_flutter.dart';

class FpsQrCodeGenerator {
  Future<String?> getPlatformVersion() {
    return FpsQrCodeGeneratorPlatform.instance.getPlatformVersion();
  }

  Future<String> generateQrCodeString(EMV emv) async {
    Generator generator = Generator();
    String qrCodeString = generator.generate(emv);
    return qrCodeString;
  }

  Widget generateQrCodeImageWidget(
      {String? qrCodeString,
      EMV? emv,
      double size = 220,
      QrEyeStyle? eyeStyle,
      bool isShowFPSLogo = false,
      Color backgroundColor = Colors.transparent,
      Color? foregroundColor,
      bool gapLess = false,
      ImageProvider<Object>? embeddedImage,
      QrEmbeddedImageStyle? embeddedImageStyle}) {
    return QrCodeWidget(
      qrCodeString: qrCodeString,
      emv: emv,
      size: size,
      eyeStyle: eyeStyle,
      isShowFPSLogo: isShowFPSLogo,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      gapLess: gapLess,
      embeddedImage: embeddedImage,
      embeddedImageStyle: embeddedImageStyle,
    );
  }
}