import 'package:flutter/material.dart';
import 'package:fps_qr_code_generator/src/generator.dart';

import 'fps_qr_code_generator.dart';
import 'fps_qr_code_generator_platform_interface.dart';

export 'package:fps_qr_code_generator/src/models/emv.dart';
export 'package:qr_flutter/qr_flutter.dart';

class FpsQrCodeGenerator {
  Future<String?> getPlatformVersion() {
    return FpsQrCodeGeneratorPlatform.instance.getPlatformVersion();
  }

  String generateQrCodeString(EMV emv) {
    Generator generator = Generator();
    String qrCodeString = generator.generate(emv);
    return qrCodeString;
  }

  Widget generateQrCodeImage(
      {required EMV emv,
      double size = 220,
      QrEyeStyle? eyeStyle,
      bool isShowFPSLogo = false,
      Color backgroundColor = Colors.transparent,
      Color? foregroundColor,
      bool gapless = false,
      ImageProvider<Object>? embeddedImage,
      QrEmbeddedImageStyle? embeddedImageStyle}) {
    String qrCodeString = generateQrCodeString(emv);
    return QrImageView(
      size: size,
      version: QrVersions.auto,
      data: qrCodeString,
      eyeStyle: eyeStyle ??
          const QrEyeStyle(eyeShape: QrEyeShape.square, color: Colors.black),
      embeddedImage: isShowFPSLogo
          ? const AssetImage('packages/fps_qr_code_generator/images/fps.png')
          : embeddedImage,
      embeddedImageStyle: embeddedImageStyle ??
          QrEmbeddedImageStyle(
            size: Size(size * 0.136, size * 0.136),
          ),
      gapless: gapless,
    );
  }
}