import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Pembaruan Privasi', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kebijakan Privasi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Selamat datang di aplikasi "AnvayaRencang". Kami berkomitmen untuk menjaga privasi dan keamanan informasi pribadi Anda. Kebijakan privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi data pribadi Anda.',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            _buildNumberedPoint(
              '1',
              'Informasi yang Kami Kumpulkan',
              'Kami dapat mengumpulkan informasi pribadi seperti:',
              [
                'Nama, email, dan nomor telepon saat Anda mendaftar.',
                'Data GPS untuk memberikan fitur pelacakan real-time.',
              ],
            ),
            _buildNumberedPoint(
              '2',
              'Penggunaan Informasi',
              'Penggunaan informasi kami menggunakan data yang dikumpulkan untuk:',
              [
                'Menyediakan layanan pelacakan teman berdasarkan lokasi.',
                'Memberikan notifikasi ketika teman berada dalam radius pengaturan yang ditetapkan.',
              ],
            ),
            _buildNumberedPoint(
              '3',
              'Keamanan Data',
              'Kami berkomitmen untuk melindung data Anda dengan menerapkan langkah-langkah keamanan yang sesuai. Namun kami tidak dapat menjamin keamanan penuh atas data yang dikirimkan melalui internet.',
              [],
            ),
            _buildNumberedPoint(
              '4',
              'Hak Anda',
              'Anda memiliki hak untuk mengakses, memperbarui, atau menghapus data pribadi Anda yang kami simpan.',
              [],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberedPoint(String number, String title, String content, List<String> bullets)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number. $title',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(content, style: TextStyle(color: Colors.white)),
        if (bullets.isNotEmpty) ...[
          SizedBox(height: 8),
          ...bullets.map((bullet) => Padding(
            padding: EdgeInsets.only(left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('•', style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(width: 8),
                Expanded(child: Text(bullet, style: TextStyle(color: Colors.white))),
              ],
            ),
          )),
        ],
        SizedBox(height: 16),
      ],
    );
  }
}