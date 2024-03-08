import 'package:flutter/material.dart';
//import 'main.dart';
//import 'MyActivity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditProfileActivity extends StatefulWidget {
  const EditProfileActivity({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<EditProfileActivity> createState() => _EditProfileActivityState();
}

class _EditProfileActivityState extends State<EditProfileActivity> {
  final int _currentIndex = 0;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Future<void> _saveProfile() async {
    // Prepare the data you want to send in the PUT request
    final Map<String, dynamic> updatedData = {
      "user": _firstNameController.text,
      "last": _lastNameController.text,
      "user": _usernameController.text,
      "email": _emailController.text,
    };

    try {
      final response = await http.put(
        Uri.parse('http://10.141.9.203:3000/api/data/update'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        // Handle success here if needed
        print('Profile updated successfully');
      } else {
        // Handle errors here
        print('Failed to update profile: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors here
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8F9E91), // Set the background color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // This will navigate back.
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF8F9E91),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 0),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF380E4A),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _firstNameController,
                                decoration:
                                    const InputDecoration(labelText: "First Name"),
                              ),
                            ),
                            const SizedBox(width: 16), // Add spacing between fields
                            Expanded(
                              child: TextField(
                                controller: _lastNameController,
                                decoration: const InputDecoration(
                                  labelText: "Last Name",
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(labelText: "Username"),
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(labelText: "Email"),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _saveProfile,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8F9E91),
                            side: const BorderSide(color: Color(0xFF380E4A)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text("Save"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //       switch (_currentIndex) {
      //         case 0:
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => HomePage(title: "HomePage"),
      //             ),
      //           );
      //           break;
      //         case 1:
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => MyActivity(title: "MyActivity"),
      //             ),
      //           );
      //           break;
      //         case 2:
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => Setting(title: "MyHomePage"),
      //             ),
      //           );
      //           break;
      //       }
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.accessibility),
      //       label: 'Activities',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //   ],
      // ),
    );
  }
}
