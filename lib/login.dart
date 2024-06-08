
import 'package:flutter/material.dart';
import 'package:ott/auth.dart';
import 'package:ott/bot.dart';


import 'create_account.dart';



class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
  bool textVisible = true;
  bool passwordVisible = true;
}

class _loginState extends State<login> {
  final _logInFormkey = GlobalKey<FormState>();
  final auth=AuthService();


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passtext = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _logInFormkey,
        child: ListView(
          children: [


            const SizedBox(
              height: 300,
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
              child: TextFormField(
                controller: email,
                validator: (emailaddress) {
                  if (emailaddress != null && emailaddress.isEmpty) {
                    return "Enter your email address";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.mail,
                      color: Colors.grey,
                    ),
                    hintText: "Enter your emailaddress",
                    labelText: "Email",
                    labelStyle: const TextStyle(color: Colors.green),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(20.0)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
              child: TextFormField(
                obscureText: passtext,
                keyboardType: TextInputType.text,
                maxLength: 6,
                controller: password,
                validator: (password) {
                  if (password != null && password.isEmpty) {
                    return "Enter your 6 digit password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passtext = !passtext;
                          });
                        },
                        icon: passtext
                            ? const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        )
                            : const Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        )),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.grey,
                    ),
                    hintText: "Enter your password",
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.green),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(20.0)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 30, right: 30, bottom: 10),
              child: SizedBox(
                height: 40.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(style: BorderStyle.solid),
                        backgroundColor:
                        const Color.fromARGB(255, 24, 166, 238),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                    onPressed: () {
                      if (_logInFormkey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => bot()),
                        );
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 30, right: 30, bottom: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(style: BorderStyle.solid),
                      backgroundColor:
                      const Color.fromARGB(255, 24, 166, 238),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                  onPressed: () async {
                    await auth.loginWithGoogle();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => bot()));

                    }, child: const Text(
    'Google Signin',
    style: TextStyle(fontSize: 18),
    ),

  ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const create_account(),
                  ),
                );
              },
              child: const Text('Create Account'),
            ),


          ],
        ),
      ),
    );
  }
}
