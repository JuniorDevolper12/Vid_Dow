import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/components/Finished%20Widgets/Vidoes%20Widgets/VideoWidget.dart';
import 'package:video_downloader/utils/App%20Helpers/Popup%20Helper/PopupHelper.dart';

import '../../../../../Provider/Audio Provider/AudioProvider.dart';
import '../../../../../Provider/Download Providers/Downloaded Vidoes/GetDownloads.dart';
import '../../../../Media Players/Audio Player/AudioPlayer.dart';

class Audiotab extends StatefulWidget {
  const Audiotab({Key? key}) : super(key: key);

  @override
  State<Audiotab> createState() => _AudiotabState();
}

class _AudiotabState extends State<Audiotab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetDownloads>(context, listen: false).fetchAndAddAudios();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetDownloads>(
      builder: (context, value, child) {
        final audios = value.audios;
        return audios.isEmpty
            ? const Center(
                child: Text(
                'No Audios',
                style: TextStyle(
                    fontFamily: "OpenSauceOne",
                    fontWeight: FontWeight.w200,
                    color: Colors.grey),
              ))
            : ListView.builder(
                itemBuilder: (context, index) {
                  final audio = audios[index];
                  return MediaWidget(
                      isaudio: true,
                      onchanged: (value) {
                        Popuphelper.AudioOptions(value!, () {
                          setState(() {});
                          Provider.of<GetDownloads>(context, listen: false)
                              .fetchAndAddAudios();
                        }, context, audio.path, audio.name);
                      },
                      Filename: audio.name,
                      widget: Container(),
                      ontap: () {
                        Provider.of<AudioPlayerProvider>(context, listen: false)
                            .play(audio.path);
                        Get.to(AudioPlayerScreen(
                          audiopath: audio.path,
                          audioname: audio.name,
                          audioid: 0,
                        ));
                      },
                      Filesize: audio.path);
                },
                itemCount: audios.length,
              );
      },
    );
  }

  String formatDuration(int totalSeconds) {
    int minutes = totalSeconds ~/ 60; // Integer division to get minutes
    int seconds = totalSeconds % 60; // Remainder to get remaining seconds
    String minutesStr = minutes.toStringAsFixed(0);
    String secondsStr = seconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }
}
