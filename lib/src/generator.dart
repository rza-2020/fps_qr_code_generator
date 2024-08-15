import 'package:fps_qr_code_generator/src/models/emv.dart';
import 'package:fps_qr_code_generator/src/utils/crc.dart';
import 'package:fps_qr_code_generator/src/utils/encoder.dart';

class Generator {
  String generate(EMV emv) {
    Encoder encoder = Encoder();
    String msg = encoder.encode(emv);
    int crc = CRC.calculate(msg);

    String crcHex = crc.toRadixString(16).toUpperCase().padLeft(4, '0');
    return msg + crcHex;
  }
}