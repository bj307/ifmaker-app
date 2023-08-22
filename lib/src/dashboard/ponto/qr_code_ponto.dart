import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class QrCodePonto extends StatefulWidget {
  const QrCodePonto({super.key});

  @override
  State<QrCodePonto> createState() => _QrCodePontoState();
}

class _QrCodePontoState extends State<QrCodePonto> {
  List<CameraDescription> cameras = [];
  CameraController? controller;
  XFile? imagem;
  Size? size;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();
      _startCamera();
    } on CameraException catch (e) {
      print(e.description);
    }
  }

  _startCamera() {
    if (cameras.isEmpty) {
      print("Camera não encontrada");
    } else {
      _previewCamera(cameras.first);
    }
  }

  _previewCamera(CameraDescription camera) async {
    final CameraController cameraController = CameraController(
        camera, ResolutionPreset.high,
        enableAudio: false, imageFormatGroup: ImageFormatGroup.jpeg);
    controller = cameraController;

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print(e.description);
    }

    if (mounted) {
      setState(() {});
    }
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
                      border: Border.all(
                          color: const Color(0xFF4CB050), width: 1.0),
                    ),
                    child: _arquivoWidget())),
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
                    onPressed: () {},
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

  _cameraPreviewWidget() {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text('Erro ao abrir a câmera');
    } else {
      return AspectRatio(
        aspectRatio: 1.0, // Proporção quadrada (1:1)
        child: CameraPreview(controller!),
      );
    }
  }

  _arquivoWidget() {
    return Container(
      child: imagem == null
          ? _cameraPreviewWidget()
          : Image.file(File(imagem!.path), fit: BoxFit.contain),
    );
  }
}
