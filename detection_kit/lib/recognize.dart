import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
//import 'package:image_picker/image_picker.dart';

class recognize extends StatefulWidget{
  const recognize({
    super.key
  });

  @override
  recognizeState createState() => recognizeState();
}

class recognizeState extends State<recognize> {
  bool _loading = true;
  late File _image;
  late List _output;

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      _output = output!;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/preprocess_model.tflite',
        //labels: 'assets/cat_and_dog/labels.txt'
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: _loading
                  ? Container()
                  : Container(),
            ),
          ],
        )
      )
    )
  }
}