import 'package:camera/camera.dart';
import 'package:detection_kit/get_cancer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'EspcontrolPage.dart';
import 'notget_cancer.dart';
import 'photo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyHomePage(camera: firstCamera),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  State<MyHomePage> createState() => _MyHomePageState(camera);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this.Camera);

  final Uri _url = Uri.parse('https://2023.igem.wiki/nthu-taiwan/index.html');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  final CameraDescription Camera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detection Kit'),
      ),
      body:Center(
        child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Text('Welcome to use Detection Kit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children:[
                    Image(
                      image: AssetImage("assets/images/Positive.png"),
                      height: 65.0,
                      fit:BoxFit.fitHeight
                  ),
                    Image(
                      image: AssetImage("assets/images/Negative.png"),
                      height: 65.0,
                      fit:BoxFit.fitHeight
                  ),
                  ]
              ),
              /*Image(
                  image: AssetImage("assets/images/C_T.png"),
                  height: 130.0,
                  fit:BoxFit.fitHeight
              ),*/
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  child: Text('Start'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => photo(camera: Camera)),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Image(
                      image: AssetImage("assets/images/logo2023.jpg"),
                      height: 100.0,
                      fit:BoxFit.fitHeight
                  ),
                  ElevatedButton(
                    onPressed: _launchUrl,
                    child: const Text("View our Wiki"),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    child: Text('Test1'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => get_cancer(camera: Camera)),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Test2'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => notget_cancer(camera: Camera)),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Test3'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EspcontrolPage()),
                      );
                    },
                  ),
                ],
              ),
            ]
        ),
      ),
    );
  }
}

