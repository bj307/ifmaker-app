import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class QrCodePonto extends StatefulWidget {
  const QrCodePonto({super.key});

  @override
  State<QrCodePonto> createState() => _QrCodePontoState();
}

class _QrCodePontoState extends State<QrCodePonto> {
  String tokenQrCode = '';

  @override
  void initState() {
    super.initState();
  }

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF", "Cancelar", false, ScanMode.QR);
    setState(() => tokenQrCode = code != '-1' ? code : '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //registrar ponto
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 22),
            child: Align(
              alignment: Alignment.topLeft,
              child:
                  Text.rich(TextSpan(style: TextStyle(fontSize: 20), children: [
                TextSpan(
                    text: 'Registrar ponto',
                    style: TextStyle(
                        color: Color(0xFF474747), fontWeight: FontWeight.bold))
              ])),
            ),
          ),

          //box camera
          Expanded(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
                child: Container(
                    decoration: BoxDecoration(
                  color: Colors.white, // Cor de fundo
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: const Color(0xFF4CB050), width: 1.0),
                ))),
          ),
          //botao registrar
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SizedBox(
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: const Color.fromARGB(255, 241, 28, 13),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () async {
                      var res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SimpleBarcodeScannerPage(),
                          ));
                      setState(() {
                        if (res is String) {
                          tokenQrCode = res;
                        }
                      });
                    },
                    child: const Text(
                      'Escanear QR Code',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
