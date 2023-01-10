import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class GifPage extends StatelessWidget {
  const GifPage(this._gifData, {
    Key? key,
  }) : super(key: key);

  final Map _gifData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gifData["title"]),
        backgroundColor: Colors.black54,
        actions: [
          IconButton(
              onPressed: () {
                share();
              },
              icon: Icon(Icons.share)),
        ],
      ),
      backgroundColor: Colors.black54,
      body: Center(
        child: Image.network(_gifData["images"]["fixed_height"]["url"]),
      ),
    );
  }

  Future <void> share() async {
    await FlutterShare.share(
      title: "Compartilhar GIF",
      text: "Compartilhe com seus amigos!",
      linkUrl: _gifData["images"]["fixed_height"]["url"],
      chooserTitle: _gifData["title"],
    );
  }

}
