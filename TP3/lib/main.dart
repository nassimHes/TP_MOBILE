import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

Future<void> sound() async {
  try {
    final player = AudioPlayer();
    await player.setAudioSource(AudioSource.asset('sounds/audio.mp3'));
    await player.play();
    print("Audio started playing");
  } catch (e) {
    print("Error playing audio: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Audio Player Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Press button to play audio',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sound,
        tooltip: 'Play Sound',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}