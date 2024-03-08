import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  PrivacyState createState() => PrivacyState();
}

class PrivacyState extends State<Privacy> {
  String _selectedVisibility = 'Public';
  int _notificationSetting =
      0; // 0 for none, 1 for Disable All, 2 for Disable Follow, 3 for Disable Comment

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF380E4A); // Define the text color

    return Scaffold(
      backgroundColor: const Color(0xFF8F9E91),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8F9E91),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 40, // Fixed height for the "Privacy" text
                  child: Center(
                    child: Text(
                      'Privacy',
                      style: TextStyle(
                        fontSize: 34, // Adjust the font size as needed
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Visibility:',
                    style: TextStyle(
                        fontSize: 18, color: textColor), // Set text color
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButton<String>(
                  value: _selectedVisibility,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedVisibility = newValue!;
                    });
                  },
                  items: ['Public', 'Private'].map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: textColor), // Set text color
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Notification Settings:',
                    style: TextStyle(
                        fontSize: 18, color: textColor), // Set text color
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Disable All Notification',
                    style: TextStyle(color: textColor), // Set text color
                  ),
                  leading: Radio(
                    value: 1,
                    groupValue: _notificationSetting,
                    onChanged: (value) {
                      setState(() {
                        _notificationSetting = value as int;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Disable Follow Notification',
                    style: TextStyle(color: textColor), // Set text color
                  ),
                  leading: Radio(
                    value: 2,
                    groupValue: _notificationSetting,
                    onChanged: (value) {
                      setState(() {
                        _notificationSetting = value as int;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Disable Comment Notification',
                    style: TextStyle(color: textColor), // Set text color
                  ),
                  leading: Radio(
                    value: 3,
                    groupValue: _notificationSetting,
                    onChanged: (value) {
                      setState(() {
                        _notificationSetting = value as int;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
