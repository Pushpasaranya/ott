


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ott/login.dart';
import 'package:ott/otppage.dart';


import 'auth.dart';


class create_account extends StatefulWidget {
  const create_account({Key? key}) : super(key: key);

  @override
  _create_accountState createState() => _create_accountState();
}

class _create_accountState extends State<create_account> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () async {
                final message = await AuthService().createUserWithEmailAndPassword(
                   _emailController.text,
                   _passwordController.text,

                );


                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => login()));

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message as String),
                  ),
                );
              },
              child: const Text('Create Account'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                controller: phoneController,

                decoration: const InputDecoration(
                  hintText: 'Enter phonenumber',
                ),
              ),
            ),SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException ex) {
                      print('Verification failed: $ex');
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(verificationid: verificationId),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    phoneNumber: phoneController.text.toString(),
                  );
                },
                child: Text("Verify Phone Number"),
            ),
          ],
        ),
      ),
    );
  }
}
