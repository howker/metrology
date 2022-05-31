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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Сканировать QR код',
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center,
        ),
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

          context.read<ItemListProvider>().loadItemsByVriId(
                vriId: code.toString(),
              ); //1-153888417  - непригодно СИ //1-56744627 - евроальфа
          final Route route = MaterialPageRoute<dynamic>(
            builder: (context) => const DetailScreen(),
          );
          Navigator.pushReplacement<void, void>(context, route);
        },
      ),
    );
  }
}
