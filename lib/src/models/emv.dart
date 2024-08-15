class EMV {
  /// This is the Faster Payment System ID, which is a unique identifier for the merchant or individual receiving the payment. It's typically a number assigned by the bank or payment service provider.
  final String? fps_id;

  /// This is the code identifying the bank associated with the account. In Hong Kong, each bank has a unique code.
  final String? bank_code;

  /// This field is for the mobile phone number associated with the account, if applicable. It's used when the account is linked to a phone number for receiving payments.
  final String? mobile;

  /// Similar to the mobile field, this is used when the account is linked to an email address for receiving payments.
  final String? email;

  /// MCC stands for Merchant Category Code. It's a four-digit number used to classify businesses by the type of goods or services they provide. For example, 5411 is used for grocery stores.
  final String? mcc;

  /// This field specifies the currency of the transaction. For Hong Kong dollar, the code is typically 344 (which is the ISO 4217 numeric code for HKD).
  final String? currency;

  /// This is the transaction amount. It's usually represented as a string to preserve decimal precision.
  final String? amount;

  /// This field can be used to include a reference number for the transaction, which can help with reconciliation or tracking.
  final String? reference;

  /// This field specifies the type of account identifier being used. In the code provided:
  /// "02" indicates the FPS ID is being used
  ///"03" might indicate a mobile number is being used
  /// "04" might indicate an email address is being used
  final String? account;

  EMV({
    this.fps_id,
    this.bank_code,
    this.mobile,
    this.email,
    this.mcc,
    this.currency,
    this.amount,
    this.reference,
    this.account,
  });
}