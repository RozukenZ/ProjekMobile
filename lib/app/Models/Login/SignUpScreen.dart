import 'package:anvayarencang/app/Models/Login/SuccessScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'AnvayaRencang.',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Enter your details below',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () async {
                  try {
                    final String name = _nameController.text.trim();
                    final String email = _emailController.text.trim();
                    final String password = _passwordController.text.trim();

                    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    await userCredential.user?.updateDisplayName(name);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessScreen()),
                    );
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to sign up: ${e.toString()}')),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Or continue with',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton('lib/app/Assets/LoginAssets/google_logo.png'),
                SizedBox(width: 20),
                _buildSocialButton('lib/app/Assets/LoginAssets/apple-logo.png'),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(color: Colors.purple),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(String iconPath) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(iconPath, width: 24, height: 24),
    );
  }
}
