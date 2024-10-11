import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              // Handle back button press
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

  Widget _buildMyCodeTab()
  {
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
            child: QrPicture(
              data: "https://example.com/mamacofron",
              version: QrVersions.auto,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Mama Cofron',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildScanCodeTab() {
    return Center(
      child: Text(
        'Scan Code functionality goes here',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class QrPicture
{

}