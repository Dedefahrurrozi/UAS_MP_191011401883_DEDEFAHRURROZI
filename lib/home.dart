// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/detail.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  List _posts = [];
}

class _HomeState extends State<Home> {
  get http => null;

  Object? get _posts => null;

  Object? get e => null;

  set _posts(_posts) {}

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('191011401883_Dede Fahrurrozi')),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: _posts[index]['urlToImage'] != null ? Image.network(_posts[index]['urlToImage']) : Center(),
            ),
            title: Text('${_posts[index]['title']}'),
            subtitle: Text('subtitle'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => Detail()));
            },
          );
        },
      ),
    );
  }

  Future _getData() async {
    try {
      final response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=id&apiKey=8fd12b9322b74b22aa2127592c7320e6');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
        print(_posts);
      }
    } catch (e) {}
    print(e);
  }
}
