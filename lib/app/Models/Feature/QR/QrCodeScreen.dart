import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QRCodeScreen extends StatefulWidget {
  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? scannedCode;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Kode QR', style: TextStyle(color: Colors.white)),
          bottom: TabBar(
            tabs: [
              Tab(text: 'My Code'),
              Tab(text: 'Scan Code'),
            ],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[800],
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: TabBarView(
          children: [
            _buildMyCodeTab(),
            _buildScanCodeTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildMyCodeTab() {
    final user = FirebaseAuth.instance.currentUser;
    String userId = user?.uid ?? 'Unknown User';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200.0,
            height: 200.0,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: QrImageView(
              data: userId,
              version: QrVersions.auto,
            ),
          ),
          SizedBox(height: 20),
          Text(
            user?.email ?? 'No Email',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildScanCodeTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  scannedCode != null
                      ? 'Scanned Code: $scannedCode'
                      : 'Scan a code',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedCode = scanData.code;
      });
    });
  }

  @override
  void dispose() {
    qrKey.currentState?.dispose();
    super.dispose();
  }
}
