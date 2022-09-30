import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GmailAuth extends StatefulWidget {
  const GmailAuth({Key? key}) : super(key: key);

  @override
  State<GmailAuth> createState() => _GmailAuthState();
}

class _GmailAuthState extends State<GmailAuth> {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future googlesignin() async {
     final GoogleSignInAccount? signInAccount= await GoogleSignIn().signIn();
     final GoogleSignInAuthentication authentication=await signInAccount!.authentication;

     final credential=await GoogleAuthProvider.credential(idToken:authentication.idToken,accessToken:authentication.accessToken );

    await auth.signInWithCredential(credential);
  }

  Future logout() async {
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(''),
            Text(''),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  googlesignin();
                },
                child: Text('Google LogIn')),SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {

                },
                child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
