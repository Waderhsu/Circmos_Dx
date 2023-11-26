import 'package:camera/camera.dart';
import 'package:detection_kit/photo.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class notget_cancer extends StatefulWidget{
  const notget_cancer({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  notget_cancerState createState() => notget_cancerState(camera);
}

class notget_cancerState extends State<notget_cancer> {
  notget_cancerState(this.Camera);

  final CameraDescription Camera;

  final Uri _url = Uri.parse('https://2023.igem.wiki/nthu-taiwan/index.html');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('You are healthy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image(
                image: AssetImage("assets/images/Negative.png"),
                //height: 130.0,
                //fit:BoxFit.fitHeight
            ),
            ElevatedButton(
              child: Text('Try again'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => photo(camera: Camera)),
                );
              },
            ),
            ElevatedButton(
                child: Text('OR learn more about Colorectal cancer'),
                onPressed: _launchUrl,/*() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },*/
            ),
          ],
        ),
      )
    );
  }
}