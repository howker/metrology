import 'package:flutter/material.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/detail/detail_screen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class QrScanner extends StatelessWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cameraController = MobileScannerController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<ItemListProvider>().loadItemsByVriId(vriId: '1-56744627');
        final Route route = MaterialPageRoute<dynamic>(
          builder: (context) => const DetailScreen(),
        );
        Navigator.push<void>(context, route);
      }),
      appBar: AppBar(
        title: const Text('Сканировать QR код'),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: cameraController.toggleTorch,
          ),
        ],
      ),
      body: MobileScanner(
        controller: cameraController,
        onDetect: (barcode, args) {
          final code = barcode.rawValue;
          debugPrint('Barcode found! $code');
        },
      ),
    );
  }
}
