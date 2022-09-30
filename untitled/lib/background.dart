import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imagePath="";
  int _counter = 0;

  void getimage() async {
    ImagePicker picker = ImagePicker();
    var pickedimage = await  picker.pickImage(source: ImageSource.gallery);
    imagePath= pickedimage!.path;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("imagepicker"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imagePath))),
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            (imagePath=='')
                ?Text('Sélectionner une image'):Text('image'),
            TextField(),
            TextField()
          ],

        ),
        )


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getimage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
