import 'package:face_recognition_app/screens/home.dart';
import 'package:face_recognition_app/screens/razorpay.dart';
import 'package:face_recognition_app/service/local_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool auth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Recognition'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await LocalAuth.authenticate().then((value) {
              if (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RazorPayScreen(),
                  ),
                );
              }
              else{
                print('mhbdsshd');
              }
            });
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
