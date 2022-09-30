import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudFetchData extends StatefulWidget {
  const CloudFetchData({Key? key}) : super(key: key);

  @override
  State<CloudFetchData> createState() => _CloudFetchDataState();
}

class _CloudFetchDataState extends State<CloudFetchData> {
  List lst = [];
  final store = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: store.collection('user').snapshots(),
            builder: (context, snapshot) {
              snapshot.data!.docs.map((e) {
                Map<String, dynamic> map = e.data() as Map<String, dynamic>;
                lst.add(map);
              }).toList();

              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        lst[index]['name'],
                      ),
                      subtitle: Text(
                        lst[index]['email'],
                      ),
                      trailing: Column(
                        children: [
                          Text(
                            lst[index]['mobile'],
                          ),
                          Text(
                            lst[index]['password'],
                          )
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
