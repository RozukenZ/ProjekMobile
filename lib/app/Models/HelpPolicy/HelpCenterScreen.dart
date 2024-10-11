import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget
{
  final List<Map<String, String>> faqItems = [
    {
      'question': 'Bagaimana cara mendaftar akun?',
      'answer': 'Untuk mendaftar, klik tombol "Daftar" di halaman utama, kemudian masukkan nama, email, dan kata sandi. Ikuti langkah-langkah selanjutnya untuk menyelesaikan proses pendaftaran.'
    },
    {
      'question': 'Bagaimana cara mencari teman di aplikasi ini?',
      'answer': 'Masuk ke menu "Pengaturan Radius Pencarian". Di sana, Anda dapat menggunakan fitur untuk mengatur jarak sesuai keinginan Anda dan menyimpannya dengan menekan tombol "Simpan Radius".'
    },
    {
      'question': 'Bagaimana cara menambahkan teman menggunakan QR Code?',
      'answer': 'Pilih menu "Tambah Teman" dan pilih opsi "Scan QR Code". Arahkan kamera ke kode QR teman Anda, lalu aplikasi akan secara otomatis menambahkan teman tersebut ke daftar Anda.'
    },
    {
      'question': 'Bagaimana cara mengirim pesan kepada teman?',
      'answer': 'Setelah Anda menambahkan teman, buka menu "Chat" di profil teman tersebut, kemudian ketik pesan Anda dan tekan tombol kirim untuk memulai panggilan.'
    },
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Pusat Bantuan', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: faqItems.length,
        itemBuilder: (context, index)
        {
          return ExpansionTile(
            title: Text(
              faqItems[index]['question']!,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  faqItems[index]['answer']!,
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
            collapsedIconColor: Colors.white,
            iconColor: Colors.white,
          );
        },
      ),
    );
  }
}