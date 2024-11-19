import 'package:animated_loading_border/animated_loading_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../fps_qr_code_generator.dart';

class QrCodeWidget extends StatefulWidget {
  final String? qrCodeString;
  final EMV? emv;
  final double size;
  final QrEyeStyle? eyeStyle;
  final bool isShowFPSLogo;
  final Color backgroundColor;
  final Color? foregroundColor;
  final bool gapLess;
  final ImageProvider<Object>? embeddedImage;
  final QrEmbeddedImageStyle? embeddedImageStyle;

  const QrCodeWidget(
      {super.key,
      this.qrCodeString,
      this.emv,
      this.size = 220,
      this.eyeStyle,
      this.isShowFPSLogo = false,
      this.backgroundColor = Colors.transparent,
      this.foregroundColor,
      this.gapLess = false,
      this.embeddedImage,
      this.embeddedImageStyle});

  @override
  QrCodeWidgetState createState() => QrCodeWidgetState();
}

class QrCodeWidgetState extends State<QrCodeWidget> {
  String? qrCodeString;

  @override
  void didUpdateWidget(covariant QrCodeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateData();
  }

  @override
  void initState() {
    super.initState();
    updateData();
  }

  Future<void> updateData() async {
    assert((widget.qrCodeString ?? "").isNotEmpty || widget.emv != null,
        'qrCodeString and emv cannot be null at the same time');
    assert(!((widget.qrCodeString ?? "").isNotEmpty && widget.emv != null),
        'qrCodeString and emv cannot be set at the same time');

    if (widget.qrCodeString?.isNotEmpty ?? false) {
      setState(() {
        qrCodeString = widget.qrCodeString;
      });
    }
    if (widget.emv != null) {
      String generatedQrCodeString =
          await FpsQrCodeGenerator().generateQrCodeString(widget.emv!);

      setState(() {
        qrCodeString = generatedQrCodeString;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return qrCodeString == null
        ? AnimatedLoadingBorder(
            borderColor: Colors.white,
            trailingBorderColor: Colors.lightBlueAccent.withAlpha(150),
            isTrailingTransparent: true,
            cornerRadius: 10.0,
            borderWidth: 5,
            child: //show loading indicator
                Container(
              width: widget.size,
              height: widget.size,
              color: widget.backgroundColor,
            ))
        : QrImageView(
            size: widget.size,
            version: QrVersions.auto,
            data: qrCodeString!,
            eyeStyle: widget.eyeStyle ??
                const QrEyeStyle(
                    eyeShape: QrEyeShape.square, color: Colors.black),
            backgroundColor: widget.backgroundColor,
            foregroundColor: widget.foregroundColor,
            gapless: widget.gapLess,
            embeddedImage: widget.embeddedImage,
            embeddedImageStyle: widget.embeddedImageStyle ??
                QrEmbeddedImageStyle(
                    size: Size(widget.size * 0.136, widget.size * 0.136)));
  }
}