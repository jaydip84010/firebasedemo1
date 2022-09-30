import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeDemo extends StatefulWidget {
  const RealtimeDemo({Key? key}) : super(key: key);

  @override
  State<RealtimeDemo> createState() => _RealtimeDemoState();
}

class _RealtimeDemoState extends State<RealtimeDemo> {
  TextEditingController name = TextEditingController();
  DatabaseReference reference = FirebaseDatabase.instance.ref('user');
  realtime() async {
    await reference.child('name').set(name.text);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                        borderSide: const BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: const Color(0xffffcd01f6))),
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
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  realtime();
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
                        colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
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
                        colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
