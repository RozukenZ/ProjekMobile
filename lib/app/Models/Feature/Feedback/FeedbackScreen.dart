import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget
{
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen>
{
  final TextEditingController _feedbackController = TextEditingController();

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
        title: Text('Umpan Balik', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _feedbackController,
                  style: TextStyle(color: Colors.white),
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: 'Tulis umpan balik Anda di sini...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text(
                'Kirim',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: ()
              {
                // TODO: Implement send functionality
                if (_feedbackController.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Umpan balik terkirim')),
                  );
                  _feedbackController.clear();
                } else
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Mohon isi umpan balik')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose()
  {
    _feedbackController.dispose();
    super.dispose();
  }
}