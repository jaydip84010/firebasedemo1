import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeFetchData extends StatefulWidget {
  const RealtimeFetchData({Key? key}) : super(key: key);

  @override
  State<RealtimeFetchData> createState() => _RealtimeFetchDataState();
}

class _RealtimeFetchDataState extends State<RealtimeFetchData> {
  DatabaseReference ref = FirebaseDatabase.instance.ref() as DatabaseReference;
  List lst = [];
  var text;

  getdata() async {
    ref.once().then((value) {
      Map map = value.snapshot.value as Map;
      lst = map.values.toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 200,
                  width: 340,
                  child: ListView.builder(
                      itemCount: lst.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                           Text(lst[index]['name']),
                            Text(lst[index]['mobile'])
                          ],
                        );
                      })),
              ElevatedButton(
                  onPressed: () {
                    getdata();
                  },
                  child: Text('press')),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
