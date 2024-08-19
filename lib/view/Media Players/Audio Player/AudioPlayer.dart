import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/components/Audio%20Widgets/Player%20Controls/PlayerControls.dart';
import 'package:video_downloader/view/Files%20Screens/Finished%20Sreens/Downloads/Downloads_Screen.dart';

import '../../../Provider/Audio Provider/AudioProvider.dart';
import '../../../components/Audio Widgets/AudioPlayer Header/AudioPlayerHeader.dart';
import '../../../components/Audio Widgets/Bar Container/BarContainer.dart';
import '../../../components/Custom Text Widgets/Custom Text Widget/CustomTextWidget.dart';
import '../../../components/Custom Text Widgets/Sliding Text/Sliding Text.dart';
import '../../../components/Gradient Widget/Main Gradient/Gradient Wigdet.dart';

class AudioPlayerScreen extends StatefulWidget {
  final String audiopath;
  final String audioname;
  final int audioid;

  const AudioPlayerScreen(
      {super.key,
      required this.audiopath,
      required this.audioname,
      required this.audioid});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Provider.of<AudioPlayerProvider>(context, listen: false).dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<AudioPlayerProvider>(context, listen: false)
    //   ..play(widget.audiopath);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Provider.of<AudioPlayerProvider>(context, listen: false).resetPlayer();
        Get.to(DownloadsScreen());
      },
      child: GradientColor(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const CustomText(
              text: 'Audio Player',
            ),
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Provider.of<AudioPlayerProvider>(context, listen: false)
                      .resetPlayer();
                  Get.to(DownloadsScreen());
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 22,
                )),
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: _buildPlayerUI(context),
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerUI(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
      builder: (context, audioProvider, child) {
        return Column(
          children: [
            AudioPlayerHeader(),
            Container(
                margin: EdgeInsets.only(top: Get.height * 0.05),
                child: SlidingText(
                  text: widget.audioname,
                  textStyle: const TextStyle(),
                )),
            StreamBuilder<bool>(
              stream: audioProvider.isPlayingStream,
              initialData: false,
              builder: (context, snapshot) {
                final isPlaying = snapshot.data!;
                return Column(
                  children: [
                    Opacity(
                      opacity: isPlaying ? 1.0 : 0.2,
                      child: Container(
                        margin: EdgeInsets.only(top: Get.height * 0.04),
                        child: Barcontainer(isplaying: isPlaying),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Get.height * 0.18),
                      child: StreamBuilder<Duration>(
                        stream: audioProvider.durationStream,
                        initialData: Duration.zero,
                        builder: (context, snapshot) {
                          final duration = snapshot.data!;
                          return StreamBuilder<Duration>(
                            stream: audioProvider.positionStream,
                            initialData: Duration.zero,
                            builder: (context, value) {
                              final position = value.data!;
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 300,
                                    child: ProgressBar(
                                        baseBarColor: Colors.grey,
                                        bufferedBarColor: Colors.purple,
                                        progressBarColor: Colors.red,
                                        thumbColor: Colors.red,
                                        onSeek: (value) {
                                          audioProvider.seek(value);
                                        },
                                        progress: position,
                                        total: duration),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: Get.height * 0.047, right: 10),
                                    child: PlayerControls(
                                        BuildContext,
                                        () {
                                          if (audioProvider.isfinished) {
                                            audioProvider
                                                .play(widget.audiopath);
                                          }
                                          if (isPlaying) {
                                            audioProvider.pause();
                                          } else if (!isPlaying) {
                                            audioProvider.playFromPause(
                                                widget.audiopath);
                                          }
                                        },
                                        () {
                                          if (position >
                                              const Duration(
                                                  milliseconds: 100)) {
                                            audioProvider.seek(
                                                const Duration(seconds: -1));
                                          }
                                        },
                                        () {
                                          if (position >
                                              const Duration(
                                                  milliseconds: 100)) {
                                            audioProvider.seek(
                                                const Duration(seconds: 2));
                                          }
                                        },
                                        isPlaying,
                                        () {
                                          audioProvider.toggleLoop();
                                        },
                                        audioProvider.islooping),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
