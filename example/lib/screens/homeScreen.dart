import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map data;
  List bookletData;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    String url = 'http://192.168.43.193:5000/api/v1/booklet';
    http.Response res = await http.get(url);
    data = json.decode(res.body);
    setState(() {
      bookletData = data["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example')),
      body: ListView.builder(
        itemCount: bookletData == null ? 0 : bookletData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text('${bookletData[index]['letter']}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Container(
                    child: Text('is for',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Container(
                    child: Text('${bookletData[index]['word']}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
