import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: audio());
  }
}

class audio extends StatefulWidget {
  const audio({super.key});

  @override
  _audioState createState() => _audioState();
}

class _audioState extends State<audio> {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  final Playlist _playlist = Playlist(
    audios: [
      Audio(
        "assets/audios/nokia.mp3",
        metas: Metas(
          title: "Nokia",
          image: MetasImage.asset("assets/images/nokia.jpg"),
        ),
      ),
      Audio(
        "assets/audios/hood.mp3",
        metas: Metas(
          title: "Hood",
          image: MetasImage.asset("assets/images/hood.jpg"),
        ),
      ),
      Audio(
        "assets/audios/toxic.mp3",
        metas: Metas(
          title: "Toxic",
          image: MetasImage.asset("assets/images/toxic.jpg"),
        ),
      ),
    ],
  );

  String _currentTitle = "No song playing";
  String _currentImage = "assets/images/default.jpg";

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer.open(
      _playlist,
      loopMode: LoopMode.playlist,
      autoStart: false,
    );
    _assetsAudioPlayer.current.listen((playing) {
      if (playing != null) {
        setState(() {
          _currentTitle = playing.audio.audio.metas.title ?? "No song playing";
          _currentImage =
              (playing.audio.audio.metas.image?.path ??
                  "assets/images/default.jpg");
        });
      }
    });
  }

  // Play audio
  void _playAudio() {
    _assetsAudioPlayer.play();
  }

  // Stop audio
  void _stopAudio() {
    _assetsAudioPlayer.stop();
  }

  void _nextAudio() {
    _assetsAudioPlayer.next();
  }

  void _previousAudio() {
    _assetsAudioPlayer.previous();
  }

  void _playAudioAtIndex(int index) {
    _assetsAudioPlayer.playlistPlayAtIndex(index);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle: true,
  //       title: const Text(
  //         'Audio player Application',
  //         style: TextStyle(fontSize: 25),
  //       ),
  //       backgroundColor: Colors.green[700],
  //       toolbarHeight: 70,
  //       elevation: 5,
  //       shadowColor: Colors.green[700],
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //     ),
  //     body: Center(
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         spacing: 10,
  //         children: [
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [Text("Playlist")],
  //           ),
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               Image.asset(_currentImage, width: 200, height: 400),
  //               const SizedBox(height: 6),
  //               Text(
  //                 'Currently Playing: $_currentTitle',
  //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //               ),
  //               const SizedBox(height: 20),
  //               Row(
  //                 spacing: 3,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   ElevatedButton(
  //                     onPressed: _playAudio,
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: Colors.green[700],
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                       padding: EdgeInsets.only(
  //                         right: 20,
  //                         left: 25,
  //                         top: 5,
  //                         bottom: 15,
  //                       ),
  //                     ),
  //                     child: const Text(
  //                       'Play',
  //                       style: TextStyle(
  //                         fontSize: 10,
  //                         letterSpacing: 1.0,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.black,
  //                       ),
  //                       textAlign: TextAlign.center,
  //                     ),
  //                   ),
  //                   SizedBox(height: 20),
  //                   ElevatedButton(
  //                     onPressed: _stopAudio,
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: Colors.green[700],
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                       padding: EdgeInsets.only(
  //                         right: 20,
  //                         left: 25,
  //                         top: 15,
  //                         bottom: 15,
  //                       ),
  //                     ),

  //                     child: const Text(
  //                       'Stop',
  //                       style: TextStyle(
  //                         fontSize: 10,
  //                         letterSpacing: 1.0,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.black,
  //                       ),
  //                       textAlign: TextAlign.center,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 20),
  //                   ElevatedButton(
  //                     onPressed: _nextAudio,
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: Colors.green[700],
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                       padding: EdgeInsets.only(
  //                         right: 20,
  //                         left: 25,
  //                         top: 15,
  //                         bottom: 15,
  //                       ),
  //                     ),
  //                     child: const Text(
  //                       'Next',
  //                       style: TextStyle(
  //                         fontSize: 10,
  //                         letterSpacing: 1.0,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.black,
  //                       ),
  //                       textAlign: TextAlign.center,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 20),
  //                   ElevatedButton(
  //                     onPressed: _previousAudio,
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: Colors.green[700],
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                       padding: EdgeInsets.only(
  //                         right: 20,
  //                         left: 25,
  //                         top: 15,
  //                         bottom: 15,
  //                       ),
  //                     ),
  //                     child: const Text(
  //                       'Previous',
  //                       style: TextStyle(
  //                         fontSize: 10,
  //                         letterSpacing: 1.0,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.black,
  //                       ),
  //                       textAlign: TextAlign.center,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Audio Player Application',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.green[700],
        toolbarHeight: 70,
        elevation: 5,
        shadowColor: Colors.green[700],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: Row(
        children: [
          // Column for currently playing song and image
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _currentImage,
                  width: 200,
                  height: 200,
                ), // Dynamic image
                const SizedBox(height: 10),
                Text(
                  'Currently Playing:',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  _currentTitle,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _previousAudio,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text(
                        'Previous',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _playAudio,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text(
                        'Play',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _stopAudio,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text(
                        'Stop',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _nextAudio,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Column for playlist
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: _playlist.audios.length,
              itemBuilder: (context, index) {
                final audio = _playlist.audios[index];

                return StreamBuilder<Playing?>(
                  stream: _assetsAudioPlayer.current,
                  builder: (context, snapshot) {
                    final isSelected =
                        snapshot.data?.audio.audio.metas.title ==
                        audio.metas.title;

                    return ListTile(
                      title: Text(
                        audio.metas.title ?? "Unknown Title",
                        style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      tileColor:
                          isSelected ? Colors.green[700] : Colors.grey[200],
                      onTap: () {
                        _playAudioAtIndex(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }
}
