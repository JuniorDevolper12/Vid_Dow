import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Download Providers/Download Provider/Downloadprovider.dart';
import '../../Custom Text Widgets/Custom Text Widget/CustomTextWidget.dart';

class MediaWidget extends StatelessWidget {
  final String Filename;
  final bool isaudio;
  final Widget widget;
  final VoidCallback ontap;
  final String Filesize;
  final void Function(String? value) onchanged;

  const MediaWidget({
    super.key,
    required this.isaudio,
    required this.onchanged,
    required this.Filename,
    required this.widget,
    required this.ontap,
    required this.Filesize,
  });

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<VideoDownloadProvider>(context);
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.002),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Get.height * 0.01),
                  child: Container(
                    height: Get.height * 0.07,
                    width: Get.width * 0.19,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: isaudio
                          ? const Icon(
                              Icons.music_note,
                              color: Colors.black,
                            )
                          : widget,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Get.width * .22, top: Get.height * 0.0046),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(4),
                      CustomText(
                        text: value.trimToLength(Filename, 25),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.004),
                        child: Row(
                          children: [
                            Opacity(
                              opacity: 0.75,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: Get.height * 0.003),
                                child: Text(
                                  isaudio
                                      ? 'Audio |${"" + value.trimToLength(Filesize, 28)}'
                                      : 'Video | ${value.trimToLength(Filesize, 29)}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSauceOne',
                                    fontSize: 8.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    left: Get.width * 0.63,
                    child: DropdownButton(
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.blue,
                      ),
                      underline: const Text(''),
                      alignment: AlignmentDirectional.bottomCenter,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'OpenSauceOne'),
                      items: [
                        DropdownMenuItem(
                            value: 'play',
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.play_arrow,
                                  color: Colors.blue,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text("Play".tr),
                                )
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'share',
                            child: Row(
                              children: [
                                const Icon(Icons.ios_share, color: Colors.blue),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text("Share".tr),
                                )
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'delete',
                            child: Row(
                              children: [
                                const Icon(Icons.delete, color: Colors.blue),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text("Delete".tr),
                                )
                              ],
                            )),
                      ],
                      onChanged: onchanged,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
