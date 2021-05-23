import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key key}) : super(key: key);

  void playSound(int soundNum) async {
    await AssetsAudioPlayer.newPlayer().open(
      Audio("assets/note$soundNum.wav"),
    );
  }

  Expanded drawKey(int soundNum, Color color) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
          backgroundColor: color, // foreground
        ),
        onPressed: () {
          playSound(soundNum);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppBar(
                title: Text(
                  'Xylophone',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                backgroundColor: Color(0xff00022E),
                toolbarOpacity: 0.8,
              ),
              drawKey(1, Color(0xffE28F81)),
              drawKey(2, Color(0xffFFC7BC)),
              drawKey(3, Color(0xff43375D)),
              drawKey(4, Color(0xff405438)),
              drawKey(5, Color(0xffF9A62C)),
              drawKey(6, Color(0xffF4444E)),
              drawKey(7, Color(0xff2A2D34)),
            ],
          ),
        ),
      ),
    );
  }
}
