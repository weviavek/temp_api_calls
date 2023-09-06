import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> putList() async {
   
        final response = await http.post(
    Uri.parse('https://run.mocky.io/v3/5464ffcd-b933-4756-8cbc-c496d94d6ff4'),
    body: {'key1': 'value1', 'key2': 'value2'},
  );

  if (response.statusCode == 200) {
    // Handle successful response
    print('Response data: ${response.body}');
  } else {
    // Handle errors
    print('Request failed with status: ${response.statusCode}');
  }
  }

  Future<void> getMyList() async {
    final temp = await http.get(Uri.parse('https://run.mocky.io/v3/5464ffcd-b933-4756-8cbc-c496d94d6ff4'));
    final data = jsonEncode(temp.body);
    print(temp.statusCode);
  }

  Future<void> deleteList() async {
    final resp = await http.delete(Uri.parse('https://run.mocky.io/v3/5464ffcd-b933-4756-8cbc-c496d94d6ff4/Fpq8sVrKpcQFBIxJN7MmubxSwH7EUvZq5Vdf'));
    print(resp.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await putList();
                },
                child: const Text("Click me")),
            ElevatedButton(
                onPressed: () async {
                  await getMyList();
                },
                child: const Text("Click me")),
            ElevatedButton(
                onPressed: () async {
                  await deleteList();
                },
                child: const Text("Click me")),
            ElevatedButton(
                onPressed: () async {
                  await getMyList();
                },
                child: const Text("Click me")),
          ],
        ),
      ),
    );
  }
}

const String accessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MzA3OWRlNTljMDM1MjIxMDUzMzc1YzVlNWQxMTBmOCIsInN1YiI6IjY0ZjAzNTc2M2E5OTM3MDBjNWMzZGFiNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.u6lBILVQCpDGf8O0yXAgAMohCAiWzNN38DCvVyExM6w';
const String apiKey = '43079de59c035221053375c5e5d110f8';
