import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Login & Signup'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Signup'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LoginCard(),
              SignupCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginCard extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  LoginCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  login(context);
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Login function
  Future<void> login(BuildContext context) async {
    UserCredential? userCredential;
    if (emailController.text.isEmpty) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.scale,
              showCloseIcon: true,
              title: "Error",
              desc: "You have not entered a your email",
              btnCancelOnPress: () {},
              btnOkOnPress: () {})
          .show();
      return;
    }
    if (passwordController.text.isEmpty) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.scale,
              showCloseIcon: true,
              title: "Error",
              desc: "You have not entered a your password",
              btnCancelOnPress: () {},
              btnOkOnPress: () {})
          .show();
      return;
    }

    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      print("Error: $e");
    }

    if (userCredential != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const HomePage(
                  title: '',
                )),
      );
    }
  }
}

class SignupCard extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  SignupCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  signUp(context);
                },
                child: const Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Sign up function
  Future<void> signUp(BuildContext context) async {
    UserCredential? userCredential;
    if (nameController.text.isEmpty) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.scale,
              showCloseIcon: true,
              title: "Error",
              desc: "You have not entered a your Name",
              btnCancelOnPress: () {},
              btnOkOnPress: () {})
          .show();
      return;
    }
    if (emailController.text.isEmpty) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.scale,
              showCloseIcon: true,
              title: "Error",
              desc: "You have not entered a your Email",
              btnCancelOnPress: () {},
              btnOkOnPress: () {})
          .show();
      return;
    }
    if (passwordController.text.isEmpty) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.scale,
              showCloseIcon: true,
              title: "Error",
              desc: "You have not entered a password",
              btnCancelOnPress: () {},
              btnOkOnPress: () {})
          .show();
      return;
    }
    if (confirmPasswordController.text.isEmpty) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.scale,
              showCloseIcon: true,
              title: "Error",
              desc: "You have not confirmed your password",
              btnCancelOnPress: () {},
              btnOkOnPress: () {})
          .show();
      return;
    }

    if (confirmPasswordController.text.compareTo(passwordController.text) !=
        0) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.scale,
              showCloseIcon: true,
              title: "Error",
              desc: "Your password and confirm password do not match",
              btnCancelOnPress: () {},
              btnOkOnPress: () {})
          .show();
      return;
    }
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
    } catch (e) {
      print("error: $e");
    }
    if (userCredential != null) {
      String id = userCredential.user!.uid;

      final user = <String, dynamic>{
        "name": nameController.text,
        "email": emailController.text,
        "id": id,
      };

      try {
        await db.collection("users").doc(id).set(user);
      } catch (e) {
        print("Error: $e");
      }
    }

    if (userCredential != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const HomePage(
                  title: '',
                )),
      );
    }
  }
}
