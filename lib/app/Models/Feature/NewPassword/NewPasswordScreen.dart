import 'package:anvayarencang/app/Models/HomeScreenModel/HomeScreen.dart';
import 'package:flutter/material.dart';

class AccountSettingsPage extends StatelessWidget
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
        title: Text('Pengaturan Akun', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PasswordField(label: 'Password Baru'),
            SizedBox(height: 16),
            PasswordField(label: 'Konfirmasi Password'),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('Simpan Perubahan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB36B85),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            Spacer(),
            TextButton(
              child: Text('Hapus Akun', style: TextStyle(color: Colors.white)),
              onPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String label;

  PasswordField({required this.label});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField>
{
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}