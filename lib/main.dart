import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        canvasColor: Colors.white,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void onSubmitted(String value) {
    setState(() {
      NameFile.name = value;
    });
  }

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: _controller.clear,
                      icon: const Icon(Icons.clear),
                    ),
                    border: const OutlineInputBorder(),
                    labelText: 'Input Name',
                  ),
                  onSubmitted: onSubmitted),
            ),
            Card(
              color: Colors.blue,
              child: Container(
                width: 200,
                height: 60,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('Hello ${NameFile.name}',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  onSubmitted(_controller.text);
                });
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}

class NameFile {
  static String name = "";
}
