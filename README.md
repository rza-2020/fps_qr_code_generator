# fps_qr_code_generator

fps qr code generator

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Basic

```dart
class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _fpsQrCodeGeneratorPlugin = FpsQrCodeGenerator();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _fpsQrCodeGeneratorPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    final emv = EMV(
      fpsId: '1234567890',
      mcc: '0000',
      currency: '344',
      amount: '123456789012345',
      account: '02',
      reference: '8999888999',
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              Text(
                  'QR Code: ${_fpsQrCodeGeneratorPlugin.generateQrCodeString(emv)}'),
              _fpsQrCodeGeneratorPlugin.generateQrCodeImage(
                size: 300,
                isShowFPSLogo: true,
                emv: emv,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Colors.black,
                ),
                // embeddedImage: const AssetImage('images/fps-icon.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

