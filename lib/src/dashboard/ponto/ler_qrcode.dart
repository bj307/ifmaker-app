import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class LerQrCode extends StatelessWidget {
  const LerQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRCodeDartScanView(
        scanInvertedQRCode:
            true, // enable scan invert qr code ( default = false)
        typeScan: TypeScan
            .live, // if TypeScan.takePicture will try decode when click to take a picture (default TypeScan.live)
        takePictureButtonBuilder: (context, controller, isLoading) {
          // if typeScan == TypeScan.takePicture you can customize the button.
          if (isLoading) return const CircularProgressIndicator();
          return ElevatedButton(
            onPressed: controller.takePictureAndDecode,
            child: const Text('Take a picture'),
          );
        },
        resolutionPreset: QRCodeDartScanResolutionPreset.high,
        formats: const [
          BarcodeFormat.QR_CODE,
        ],
        onCapture: (Result result) {
          result.text;
        },
      ),
    );
  }
}
