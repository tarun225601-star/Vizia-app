à¤®à¥à¤ à¤¸à¤®à¤à¤¤à¤¾ à¤¹à¥à¤ à¤à¤¿ à¤à¤ªà¤à¥ à¤à¤ à¤à¤®à¥à¤ à¤ªà¤¾à¤¥ à¤¸à¥ à¤¸à¤à¤¬à¤à¤§à¤¿à¤¤ à¤à¤°à¤° à¤ à¤°à¤¹à¤¾ à¤¹à¥à¥¤ à¤¯à¤¹ à¤à¤°à¤° à¤à¤®à¤¤à¥à¤° à¤ªà¤° à¤¤à¤¬ à¤¹à¥à¤¤à¤¾ à¤¹à¥ à¤à¤¬ à¤à¤ª à¤à¤ à¤«à¤¼à¤¾à¤à¤² à¤ªà¤¾à¤¥ à¤à¥ à¤¸à¤¹à¥ à¤¤à¤°à¥à¤à¥ à¤¸à¥ à¤¨à¤¹à¥à¤ à¤¦à¥ à¤ªà¤¾ à¤°à¤¹à¥ à¤¹à¥à¤¤à¥ à¤¹à¥à¤à¥¤ à¤¯à¤¹à¤¾à¤ à¤à¤ à¤à¤¦à¤¾à¤¹à¤°à¤£ à¤à¥à¤¡ à¤¹à¥ à¤à¥ à¤à¤ªà¤à¥ à¤à¤¸ à¤à¤°à¤° à¤à¥ à¤ à¥à¤ à¤à¤°à¤¨à¥ à¤®à¥à¤ à¤®à¤¦à¤¦ à¤à¤° à¤¸à¤à¤¤à¤¾ à¤¹à¥:


import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ImagePathExample extends StatefulWidget {
  @override
  _ImagePathExampleState createState() => _ImagePathExampleState();
}

class _ImagePathExampleState extends State<ImagePathExample> {
  String _imagePath = '';

  Future<void> _getImagePath() async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = directory.path + '/image.jpg';
    setState(() {
      _imagePath = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Path Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_imagePath),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImagePath,
              child: Text('Get Image Path'),
            ),
          ],
        ),
      ),
    );
  }
}


à¤à¤¸ à¤à¥à¤¡ à¤®à¥à¤, à¤¹à¤® `path_provider` à¤ªà¥à¤à¥à¤ à¤à¤¾ à¤à¤ªà¤¯à¥à¤ à¤à¤°à¤à¥ à¤à¤ªà¥à¤²à¤¿à¤à¥à¤¶à¤¨ à¤à¥ à¤¡à¥à¤à¥à¤¯à¥à¤®à¥à¤à¤à¥à¤¸ à¤¡à¤¾à¤¯à¤°à¥à¤à¥à¤à¤°à¥ à¤à¤¾ à¤ªà¤¾à¤¥ à¤ªà¥à¤°à¤¾à¤ªà¥à¤¤ à¤à¤° à¤°à¤¹à¥ à¤¹à¥à¤ à¤à¤° à¤«à¤¿à¤° à¤à¤¸à¤®à¥à¤ à¤à¤ à¤à¤®à¥à¤ à¤«à¤¼à¤¾à¤à¤² à¤à¤¾ à¤ªà¤¾à¤¥ à¤¬à¤¨à¤¾ à¤°à¤¹à¥ à¤¹à¥à¤à¥¤ à¤¯à¤¹ à¤ªà¤¾à¤¥ à¤¸à¤¹à¥ à¤¤à¤°à¥à¤à¥ à¤¸à¥ à¤¦à¤¿à¤¯à¤¾ à¤à¤¾à¤¨à¤¾ à¤à¤¾à¤¹à¤¿à¤ à¤¤à¤¾à¤à¤¿ à¤à¤°à¤° à¤¨ à¤¹à¥à¥¤

à¤à¤¸à¤à¥ à¤à¤²à¤¾à¤µà¤¾, à¤¯à¤¦à¤¿ à¤à¤ª à¤à¤ à¤à¥à¤¶ à¤«à¤¼à¤¾à¤à¤² à¤à¤¾ à¤ªà¤¾à¤¥ à¤ªà¥à¤°à¤¾à¤ªà¥à¤¤ à¤à¤°à¤¨à¤¾ à¤à¤¾à¤¹à¤¤à¥ à¤¹à¥à¤, à¤¤à¥ à¤à¤ª `getCacheDir()` à¤«à¤¼à¤à¤à¥à¤¶à¤¨ à¤à¤¾ à¤à¤ªà¤¯à¥à¤ à¤à¤° à¤¸à¤à¤¤à¥ à¤¹à¥à¤:


final cacheDir = await getCacheDir();
final imagePath = cacheDir.path + '/image.jpg';


à¤¯à¤¹ à¤à¥à¤¡ à¤à¤ªà¤à¥ à¤à¥à¤¶ à¤¡à¤¾à¤¯à¤°à¥à¤à¥à¤à¤°à¥ à¤®à¥à¤ à¤à¤ à¤à¤®à¥à¤ à¤«à¤¼à¤¾à¤à¤² à¤à¤¾ à¤ªà¤¾à¤¥ à¤ªà¥à¤°à¤¾à¤ªà¥à¤¤ à¤à¤°à¤¨à¥ à¤®à¥à¤ à¤®à¤¦à¤¦ à¤à¤°à¥à¤à¤¾à¥¤