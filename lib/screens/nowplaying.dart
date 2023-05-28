import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:musicuitest/globalpage.dart';
import 'package:musicuitest/screens/navigatorpage.dart';
import 'package:on_audio_query/on_audio_query.dart';

AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();
bool isPlaying = false;
late int index1;
final OnAudioQuery _audioQuery = OnAudioQuery();

void playMusic1() {
  if (isPlaying) {
    _audioPlayer.pause();
    isPlaying = !isPlaying;
  } else {
    _audioPlayer.play();
    isPlaying = !isPlaying;
  }
}

void skipNext1() async {
  _audioPlayer.stop();
  await _audioPlayer.open(
    Audio.file(allfilePaths[index1 + 1]),
    autoStart: true,
  );
  index1++;
  songNameindex = index1;
}

void skipPrevious1() async {
  index1--;
  songNameindex = index1;
  _audioPlayer.stop();
  await _audioPlayer.open(
    Audio.file(allfilePaths[index1]),
    autoStart: true,
  );
}

void stopMiniplayer() {
  _audioPlayer.pause();
}

class NowPlaying extends StatefulWidget {
  int index;

  NowPlaying({super.key, required this.index});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  int currentTrackIndex = 0;

  bool isRepeatEnabled = false;
  Color repeatButtonColor = Colors.black;
  bool skipPreviousEnabled = false;
  bool normal = false;
  late int nameIndex;
  bool isManualNextOrPrevious = false;

  Duration _currentDuration = Duration.zero;

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${duration.inHours > 0 ? twoDigits(duration.inHours) + ':' : ''}$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState() {
    super.initState();
    openMusic(); //music opened here
  }

  double seekBarValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 250, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 47, 47),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.amber,
          ),
          onPressed: () async {
            setState(() {
              showMiniPlayer = true;
              index1 = widget.index;
              songNameindex = index1;
            });
            final result = await Navigator.push<int>(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigatorPage(),
              ),
            );
            setState(() {
              widget.index = result!;
            });
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const RadialGradient(
                colors: [
                  Color.fromARGB(255, 47, 47, 47),
                  Color.fromARGB(255, 47, 47, 47),
                ],
                center: Alignment.topLeft,
                radius: 5,
              ),
            ),
            child: const Row(
              children: [
                SizedBox(width: 45),
                Text(
                  "Now Playing",
                  style: TextStyle(
                    color: Color.fromARGB(255, 27, 164, 179),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 254, 254, 253),
              Color.fromARGB(255, 61, 61, 58),
            ],
            center: Alignment.topLeft,
            radius: 3.5,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 25, right: 25),
                  child: Container(
                    width: 310,
                    height: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      gradient: const RadialGradient(
                        colors: [
                          Color.fromARGB(255, 61, 61, 58),
                          Color.fromARGB(255, 254, 254, 253),
                        ],
                        center: Alignment.bottomRight,
                        radius: 1.4,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Image.asset(
                        //   "asset/images/music-band.png",
                        //   width: 250,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: SizedBox(
                            width: 240,
                            height: 220,
                            child: QueryArtworkWidget(
                              controller: _audioQuery,
                              //id: ids[currentindex],
                              id: ids[widget.index],
                              type: ArtworkType.AUDIO,
                              artworkBorder: BorderRadius.circular(
                                  30), // Set the desired height // Set the desired aspect ratio
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // const Text(
                        //   "Song Name - Artist",
                        //   style: TextStyle(
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        Text(
                          //songNames[currentindex],
                          songNames[widget.index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          //artistNames[currentindex]!,
                          artistNames[widget.index]!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20),
                  child: SizedBox(
                    width: 310,
                    height: 30,
                    child: StreamBuilder<RealtimePlayingInfos>(
                      stream: _audioPlayer.realtimePlayingInfos,
                      builder: (BuildContext context,
                          AsyncSnapshot<RealtimePlayingInfos> snapshot) {
                        if (snapshot.hasData) {
                          final RealtimePlayingInfos infos = snapshot.data!;
                          final Duration? totalDuration =
                              infos.current?.audio.duration;
                          final Duration currentPosition =
                              infos.currentPosition;

                          if (totalDuration != null) {
                            final String totalDurationString =
                                _formatDuration(totalDuration);
                            final String currentPositionString =
                                _formatDuration(currentPosition);

                            return GestureDetector(
                              onHorizontalDragUpdate:
                                  (DragUpdateDetails details) {
                                final double dragPosition =
                                    details.localPosition.dx;
                                final double width = context.size!.width;
                                final double seekPercentage =
                                    dragPosition / width;
                                final Duration seekDuration =
                                    totalDuration * seekPercentage;
                                _audioPlayer.seek(seekDuration);
                              },
                              child: LinearProgressIndicator(
                                value: currentPosition.inMilliseconds /
                                    totalDuration.inMilliseconds,
                                minHeight: 5.0,
                                backgroundColor:
                                    const Color.fromARGB(255, 239, 234, 234),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 27, 164, 179),
                                ),
                              ),
                            );
                          }
                        }
                        return const LinearProgressIndicator(
                          value: 0.0,
                          minHeight: 25.0,
                          backgroundColor: Colors.grey,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 20, top: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color.fromARGB(255, 239, 234, 234),
                        ),
                        child: IconButton(
                          onPressed: () {
                            skipPreviousEnabled = true;
                            skipPrevious();
                          },
                          icon: const Icon(
                            Icons.skip_previous,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color.fromARGB(255, 239, 234, 234),
                        ),
                        child: IconButton(
                          onPressed: seekBackward,
                          icon: const Icon(
                            Icons.replay_10,
                            color: Colors.black,
                            size: 21,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color.fromARGB(255, 239, 234, 234),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              playMusic();
                            });
                          },
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: isPlaying
                                ? const Color.fromARGB(255, 27, 164, 179)
                                : Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color.fromARGB(255, 239, 234, 234),
                        ),
                        child: IconButton(
                          onPressed: seekForward,
                          icon: const Icon(
                            Icons.forward_10,
                            color: Colors.black,
                            size: 21,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color.fromARGB(255, 239, 234, 234),
                        ),
                        child: IconButton(
                          onPressed: skipNext,
                          icon: const Icon(
                            Icons.skip_next,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 20, top: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color.fromARGB(255, 239, 234, 234),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shuffle,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color.fromARGB(255, 239, 234, 234),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color.fromARGB(255, 239, 234, 234),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.playlist_add,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          //color: const Color.fromARGB(255, 239, 234, 234),
                          color: isRepeatEnabled
                              ? const Color.fromARGB(255, 27, 164, 179)
                              : const Color.fromARGB(255, 239, 234, 234),
                        ),
                        child: IconButton(
                          onPressed: toggleRepeat,
                          icon: const Icon(
                            Icons.repeat,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  late int currentindex;
  late int manually;

  void toggleRepeat() {
    setState(() {
      isRepeatEnabled = !isRepeatEnabled;
      repeatButtonColor = isRepeatEnabled ? Colors.blue : Colors.black;
    });
  }

  void openMusic() async {
    currentindex = widget.index;
    String filePath = allfilePaths[currentindex];
    await _audioPlayer.open(
      Audio.file(filePath),
      autoStart: true,
    );
    setState(() {
      isPlaying = true; // Set isPlaying to true when opening the music
    });

    _audioPlayer.playlistAudioFinished.listen((Playing playing) {
      if (!isManualNextOrPrevious) {
        nextMusic();
      } else {
        isManualNextOrPrevious =
            false; // Reset the flag after manual next/previous
      }
    });
  }

  void playMusic() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void skipNext() async {
    _audioPlayer.stop();
    widget.index++;
    setState(() {
      isPlaying = false;
      isManualNextOrPrevious = true; // Set the flag for manual next/previous
    });
    openMusic();
  }

  void skipPrevious() async {
    _audioPlayer.stop();
    widget.index--;
    setState(() {
      isPlaying = false;
      isManualNextOrPrevious = true; // Set the flag for manual next/previous
    });
    openMusic();
  }

  void nextMusic() async {
    _audioPlayer.stop();
    widget.index++;
    setState(() {
      isPlaying = true;
    });
    String filePath = allfilePaths[widget.index];
    await _audioPlayer.open(
      Audio.file(filePath),
      autoStart: true,
    );
    widget.index--;
  }

  void seekForward() {
    _audioPlayer.seekBy(const Duration(seconds: 10));
  }

  void seekBackward() {
    _audioPlayer.seekBy(const Duration(seconds: -10));
  }
}
