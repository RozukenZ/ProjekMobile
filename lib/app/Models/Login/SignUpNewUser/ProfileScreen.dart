import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: ()
          {
            // Handle back button press
          },
        ),
        title: Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[800],
                    child: Icon(Icons.camera_alt, size: 40, color: Colors.white),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.edit, size: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            _buildTextField('Name'),
            SizedBox(height: 15),
            _buildTextField('Email (read-only)', enabled: false),
            SizedBox(height: 15),
            _buildDropdownField('Preferred Pronoun'),
            SizedBox(height: 15),
            _buildTextField('Public'),
            SizedBox(height: 15),
            _buildTextField('Hanya Teman'),
            SizedBox(height: 15),
            _buildTextField('Privat'),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Simpan Perubahan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: ()
                {
                  // Handle save changes
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool enabled = true})
  {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      enabled: enabled,
    );
  }

  Widget _buildDropdownField(String label)
  {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      items: <String>['He/Him', 'She/Her', 'They/Them', 'Other']
          .map<DropdownMenuItem<String>>((String value)
      {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue)
      {
        // Handle dropdown change
      },
    );
  }
}