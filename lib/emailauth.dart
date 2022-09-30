import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/main.dart';
import 'package:flutter/material.dart';

class EmailAuth extends StatefulWidget {
  const EmailAuth({Key? key}) : super(key: key);

  @override
  State<EmailAuth> createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  FirebaseAuth auth = FirebaseAuth.instance;
  EmailAuth? emailAuth;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signup() {
    auth.createUserWithEmailAndPassword(
        email: email.text, password: password.text);
    print(auth.currentUser);
  }

  login() async {
    final newuser = await auth.signInWithEmailAndPassword(
        email: email.text, password: password.text);
    if (newuser.user!.uid == auth.currentUser!.uid) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FirebaseDemo()));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: email,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: password,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                signup();
              },
              child: Center(child: Text("SignUp"))),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                login();
              },
              child: Center(child: Text("SignIn")))
        ],
      ),
    );
  }
}
