

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudDemo extends StatefulWidget {
  const CloudDemo({Key? key}) : super(key: key);

  @override
  State<CloudDemo> createState() => _CloudDemoState();
}

class _CloudDemoState extends State<CloudDemo> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController mobile = TextEditingController();
  final form = GlobalKey<FormState>();
  late bool visible = false;
  final store = FirebaseFirestore.instance;
  List lst = [];

  @override
  void initState() {
    super.initState();
  }

  senddata() {
    Map<String, dynamic> map = {
      'name': name.text,
      'email': email.text,
      'mobile': mobile.text,
      'password': password.text
    };
    store.collection('user').add(map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 1.4,
            width: 350,
            child: SingleChildScrollView(
              child: Form(
                  key: form,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        textAlignVertical: TextAlignVertical.center,
                        validator: (name) {
                          if (name!.isEmpty) {
                            return "enter name";
                          } else {
                            return null;
                          }
                        },
                        controller: name,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 20, left: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: const Color(0xffffcd01f6))),
                            label: const Text(
                              ' Name',
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffff6e7784),
                              ),
                            ),
                            alignLabelWithHint: true,
                            hintText: 'Name',
                            hintStyle: const TextStyle(
                              debugLabel: 'sks',
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffff6e7784),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textAlignVertical: TextAlignVertical.center,
                        controller: email,
                        validator: (email) {
                          if (email!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(email)) {
                            return "enter Email";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 20, left: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color(0xffffcd01f6))),
                            label: const Text(
                              ' Email',
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffff6e7784),
                              ),
                            ),
                            alignLabelWithHint: true,
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffff6e7784),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        textAlignVertical: TextAlignVertical.center,
                        controller: mobile,
                        validator: (mobile) {
                          if (mobile!.isEmpty ||
                              mobile.length < 10 ||
                              mobile.length > 10) {
                            return "enter mobile number";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 20, left: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: const Color(0xffffcd01f6))),
                            label: const Text(
                              ' Mobile Number',
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffff6e7784),
                              ),
                            ),
                            alignLabelWithHint: true,
                            hintText: 'Mobile Numer',
                            hintStyle: TextStyle(
                              debugLabel: 'sks',
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffff6e7784),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: visible ? false : true,
                        textAlignVertical: TextAlignVertical.center,
                        controller: password,
                        validator: (password) {
                          if (password!.isEmpty || password.length < 8) {
                            return "enter password";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 20, left: 10),
                            suffixIcon: IconButton(
                              icon: Icon(
                                visible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0xffffcd01f6))),
                            label: const Text(
                              ' Password',
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffff6e7784),
                              ),
                            ),
                            alignLabelWithHint: true,
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              debugLabel: 'sks',
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffff6e7784),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          senddata();
                        },
                        child: Container(
                          height: 45,
                          width: 350,
                          child: Center(
                            child: Text(
                              'send',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.pinkAccent,
                                  Colors.deepPurpleAccent
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          print((lst[0]['name']));
                        },
                        child: Container(
                          height: 45,
                          width: 350,
                          child: Center(
                            child: Text(
                              'fetch',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.pinkAccent,
                                  Colors.deepPurpleAccent
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 300,width: 300,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: store.collection('user').snapshots(),
                            builder: (context, snapshot) {
                              snapshot.data!.docs.map((e) {
                                Map<String, dynamic> map =
                                    e.data() as Map<String, dynamic>;
                                lst.add(map);
                              }).toList();

                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return Row(children: [Text(lst[index]['name']),Text(lst[index]['email']),Text(lst[index]['mobile']),Text(lst[index]['password'])],);
                                  });
                            }),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
