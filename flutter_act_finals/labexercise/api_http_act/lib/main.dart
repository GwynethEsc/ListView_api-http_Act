import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//Author: Gwyneth Escabusa
//Section: BSIT3R6

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View with API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<dynamic> photos = [];

  @override
  void initState() {
    getPhotos();
    super.initState();
  }

  getPhotos() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");

    var response = await http.get(url);

    setState(() {
      photos = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View with API"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(photos[index]["title"]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID: ${photos[index]["id"]}"),
                Image.network(
                  photos[index]["url"],
                  height: 80.0, 
                  width: 80.0, 
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
