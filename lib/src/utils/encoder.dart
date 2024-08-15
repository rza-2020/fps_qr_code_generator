import 'package:fps_qr_code_generator/src/models/emv.dart';

class Encoder {
  String pad(String str, int len) {
    return str.padLeft(len, '0');
  }

  String dataObj(String id, String value) {
    String paddedLength = pad(value.length.toString(), 2);
    return '$id$paddedLength$value';
  }

  String encode(EMV obj) {
    String payloadFormatIndicator = dataObj("00", "01");
    String pointOfInitiationMethod =
        dataObj("01", (obj.amount == "") ? "11" : "12");

    String guid = dataObj("00", "hk.com.hkicl");
    String merchantAccountInformationTemplate = "";

    switch (obj.account) {
      case "02":
        merchantAccountInformationTemplate = dataObj("02", obj.fpsId!);
        break;
      case "03":
        merchantAccountInformationTemplate =
            dataObj("01", obj.bankCode!) + dataObj("03", obj.mobile!);
        break;
      case "04":
        merchantAccountInformationTemplate = dataObj("01", obj.bankCode!) +
            dataObj("04", obj.email!.toUpperCase());
        break;
    }

    String merchantAccountInformation =
        dataObj("26", guid + merchantAccountInformationTemplate);
    String merchantCategoryCode = dataObj("52", obj.mcc!);
    String transactionCurrency = dataObj("53", obj.currency!);

    String countryCode = dataObj("58", "HK");
    String merchantName = dataObj("59", "NA");
    String merchantCity = dataObj("60", "HK");
    String transactionAmount =
        ((obj.amount?.length ?? 0) == 0) ? "" : dataObj("54", obj.amount!);
    String reference =
        (obj.reference == "") ? "" : dataObj("05", obj.reference!);
    String additionalDataTemplate =
        (reference == "") ? "" : dataObj("62", reference);

    String msg = "";
    msg += payloadFormatIndicator;
    msg += pointOfInitiationMethod;
    msg += merchantAccountInformation;
    msg += merchantCategoryCode;
    msg += transactionCurrency;
    msg += transactionAmount;
    msg += countryCode;
    msg += merchantName;
    msg += merchantCity;
    msg += additionalDataTemplate;
    msg += "6304";

    return msg;
  }
}