import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasedemo/firemessaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: FireMessaging(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirebaseDemo extends StatefulWidget {
  const FirebaseDemo({Key? key}) : super(key: key);

  @override
  State<FirebaseDemo> createState() => _FirebaseDemoState();
}

class _FirebaseDemoState extends State<FirebaseDemo> {
  FirebaseAuth auth = FirebaseAuth.instance;
  static TextEditingController phone = TextEditingController();
  static TextEditingController otpf = TextEditingController();
  var verificationId;
  PhoneAuthCredential? authCredential;

  verifynumber() {
    auth.verifyPhoneNumber(
        phoneNumber: '+91${phone.text}',
        verificationCompleted: (PhoneAuthCredential credential) {
          print('verified success');
        },
        verificationFailed: (FirebaseAuthException error) {
          print("verification failed");
        },
        codeSent: (String verifyId, int? resendtoken) {
          print('sent otp on your device successfully');
        },
        codeAutoRetrievalTimeout: (String verifyId) {
          verificationId = verifyId;
          print('wrong otp');
        });
  }

  otpverify(String verificationId, String otp) async {
    await auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp));
  }

  otp() {
    if (authCredential!.smsCode != otpf.text) {
      return "otp khoto 6e";
    } else {
      return "otp success";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: phone),
          SizedBox(
            height: 20,
          ),
          TextField(controller: otpf),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                verifynumber();
              },
              child: Center(child: Text('send'))),
          ElevatedButton(
              onPressed: () {
                otp();
              },
              child: Center(child: Text('otp verified'))),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                auth.signOut();
              },
              child: Center(child: Text('Logout')))
        ],
      ),
    );
  }
}
