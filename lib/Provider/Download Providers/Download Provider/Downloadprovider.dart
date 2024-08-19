import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/BottomDownloadSheet/Header Widget/HeaderWidget.dart';
import '../../../components/BottomDownloadSheet/Radio Tiles/RadioTiles.dart';
import '../../../components/BottomDownloadSheet/TitleWidget/TitleWidget.dart';
import '../../../components/Buttons Widgets/Square Button/Buttonswidget.dart';
import '../../../components/Gradient Widget/Main Gradient/Gradient Wigdet.dart';
import '../../../utils/App Helpers/Snackbar/ShowSnackbar.dart';
import '../../../utils/App Helpers/Toast Helper/ToastHelper.dart';
import '../../../utils/App Utils/App Constants/constants.dart';

class VideoDownloadProvider extends ChangeNotifier {
  DateTime now = DateTime.now();
  final int _year = 0;
  final int _day = 0;
  final int _month = 0;
  bool _iswifi = false;
  bool shown = false;

  int get day => _day;

  int get month => _month;

  int get year => _year;
  bool _isDownloading = false;
  final availableQualities = <String>[];
  String? _selectedquality;

  String? get selectedquality => _selectedquality;
  String _videoname = '';

  String get videoname => _videoname;
  String _thumbnailimage = '';

  String get thumbnailimage => _thumbnailimage;
  final fileSizes = <String, String>{};
  bool is1080p = false;
  bool is720p = false;
  bool is480p = false;
  bool is360p = false;
  bool is244p = false;
  bool is144p = false;
  bool ismp3 = false;
  bool isselaudio = false;
  bool fb1080p = false,
      fb720 = false,
      fb480 = false,
      fb360 = false,
      fb240 = false;
  bool istiktok = false;
  List<dynamic> _links = [];
  bool isfacebook = false;
  bool fbaudio = false;
  int Taskid = 0;
  late StreamSubscription progressStream;

  bool get savedata => _savedata;

  List<dynamic> get links => _links;
  bool failed = false;

  bool get isDownloading => _isDownloading;
  String file1080p = '';
  String hdnowatermark = '';
  String no_watermark = '';
  String watermark = '';
  String mp3 = '';
  String fileonlyhd = '';
  String file720p = '';
  String file480p = '';
  String file360p = '';
  String file244p = '';
  String file144p = '';
  bool ishdnowatermark = false;

  String fileaudio = '';
  bool isonlyhd = false;
  bool isfbhd = false;
  bool _isloading = false;
  bool isinstagram = false;
  bool isX = false;

  bool get isloading => _isloading;
  late bool _savedata;
  bool isinta = false;
  String Xlink = '';

  bool get iswifi => _iswifi;
  String? instalink;
  String? fblinkhd;
  String? fbsdlink;
  String? fbaudiolink;
  bool isx = false;
  bool isvimeo = false;
  String vimeoLink = '';

  Future<void> updateSavedData(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('savedata', newValue);
    await prefs.reload();
    _savedata = newValue;
    notifyListeners();
    print(_savedata);
    if (newValue) {
      Snackbarhelper.Showsnackbar('Data Saving Mode', 'Turned on');
    } else if (!newValue) {
      Snackbarhelper.Showsnackbar('Data Saving Mode', 'Turned off');
    }
  }

  Future<void> checkwifi() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi)) {
      _iswifi = true;
      notifyListeners();
    } else if (connectivityResult.contains(ConnectivityResult.mobile)) {
      _iswifi = false;
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  void deleteDownload(String taskId) {
    var box = Hive.box<Map<dynamic, dynamic>>('downloads');
    box.delete(taskId);
  }

  void deleteStuckDownloads() {
    var box = Hive.box<Map<dynamic, dynamic>>('downloads');
    var now = DateTime.now();
    var stuckDownloads = box.keys.where((key) {
      var download = box.get(key);
      var startTime = DateTime.parse(download!['startTime']);
      var duration = now.difference(startTime);
      return download['progress'] < 1.0 && duration.inMinutes > 5;
    }).toList();

    for (var key in stuckDownloads) {
      box.delete(key);
    }
  }

  void flushBox() {
    var box = Hive.box<Map<dynamic, dynamic>>('downloads');
    box.clear();
  }

  void getsavedata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _savedata = prefs.getBool('savedata') ?? false;
    await prefs.reload();
    notifyListeners();
  }

  Future<void> EnterDownload(
      String url, String Filename, String thumbnail) async {
    Random random = Random();
    Taskid = random.nextInt(100);
    var box =
        Hive.box<Map<dynamic, dynamic>>('downloads'); // Access the opened box
    if (Filename.contains('mp3')) {
      isselaudio = true;
      notifyListeners();
    }
    Directory dir = Directory('Video Downloader');
    if (!dir.existsSync()) {
      dir.create();
    }
    FileDownloader.downloadFile(
        name: Filename,
        url: url,
        notificationType: NotificationType.all,
        onProgress: (fileName, progress) async {
          try {
            var download = box.get(Taskid);
            if (download != null) {
              download['progress'] = progress;
              await box.put(Taskid, download);
            }
          } catch (error) {
            print('Error updating progress: $error');
          }
          notifyListeners();
          print(progress);
        },
        onDownloadCompleted: (path) async {
          notifyListeners();
          Toasthelper.Showtoast('Download Completed');
          try {
            await box.delete(Taskid);
          } catch (error) {
            print('Error deleting download: $error');
          }
          _isDownloading = false;
          notifyListeners();
          print(path);
        },
        onDownloadRequestIdReceived: (downloadRequestId) async {
          print(videoname);
          try {
            await box.put(Taskid, {
              'downloadId': downloadRequestId,
              'progress': 0.0,
              'videoname': Filename,
              'thumbnailImage': thumbnail,
              'startTime': DateTime.now(),
            });
          } catch (error) {
            print('Error adding download: $error');
          }
          _isDownloading = true;
          notifyListeners();
          Toasthelper.Showtoast('Download Started');
        },
        onDownloadError: (errorMessage) async {
          print(errorMessage);
          failed = true;
          notifyListeners();
          try {
            await box.delete(Taskid);
          } catch (error) {
            print('Error deleting download: $error');
          }
          _isDownloading = false;
          notifyListeners();
        },
        subPath: dir.path);
    reset();
  }

  void showerrortoast() {
    Toasthelper.Showtoast('Error Could Not Download');
  }

  void startdownload(String quality, BuildContext context) {
    getsavedata();
    checkwifi();
    if (selectedquality!.isNotEmpty) {
      if (_selectedquality!.contains('hd')) {
        EnterDownload(
            fileonlyhd,
            '${trimToLength(_videoname, 25)} _by_video_downloader.mp4',
            _thumbnailimage);
      }

      if (_selectedquality!.contains('720')) {
        EnterDownload(
            file720p,
            '${trimToLength(_videoname, 28)} _by_video_downloader.mp4',
            _thumbnailimage);
      }
      if (_selectedquality!.contains('480')) {
        EnterDownload(
            file480p,
            '${trimToLength(_videoname, 28)} _by_video_downloader.mp4',
            _thumbnailimage);
      }
      if (_selectedquality!.contains('360')) {
        EnterDownload(
            file360p,
            '${trimToLength(_videoname, 28)} _by_video_downloader.mp4',
            _thumbnailimage);
      }
      if (_selectedquality!.contains('244')) {
        EnterDownload(
            file244p,
            '${trimToLength(_videoname, 28)} _by_video_downloader.mp4',
            _thumbnailimage);
      }
      if (_selectedquality!.contains('144')) {
        EnterDownload(
            file144p,
            '${trimToLength(_videoname, 28)} _by_video_downloader.mp4',
            _thumbnailimage);
      }
      if (_selectedquality!.contains('audio')) {
        EnterDownload(
            fileaudio,
            '${trimToLength(_videoname, 28)} _by_video_downloader.mp3',
            _thumbnailimage);
      }
      Navigator.pop(context);
    } else {
      Toasthelper.Showtoast('No Quality Selected');
    }
  }

  Future<void> downloadVideo(BuildContext context, String VideoUrl) async {
    reset();
    getsavedata();
    checkwifi();
    if (VideoUrl.contains('facebook') ||
        VideoUrl.contains('instagram') ||
        VideoUrl.contains('tiktok') && VideoUrl.isNotEmpty) {
      _isloading = true;
      notifyListeners();
      var uri = Uri.https(
        'social-media-video-downloader.p.rapidapi.com',
        '/smvd/get/all',
        {'url': VideoUrl},
      );
      final headers = {
        'X-RapidAPI-Key': VdConstants.ApiKey,
        'X-RapidAPI-Host': 'social-media-video-downloader.p.rapidapi.com'
      };
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        _isloading = false;
        notifyListeners();
        final jsonData = jsonDecode(response.body);
        _links = jsonData['links'];
        _videoname = jsonData['title'];
        _thumbnailimage = jsonData['picture'];
        // for (var item in jsonData['links']) {
        //   availableQualities.add(item['quality']);
        // }
        for (var item in jsonData['links']) {
          if (item['quality'].contains('render_1080p')) {
            file1080p = item['link'];
            is1080p = true;
            notifyListeners();
          }
          if (item['quality'].contains('hd_720p')) {
            is720p = true;
            file720p = item['link'];
            notifyListeners();
          }
          if (item['quality'].contains('sd_0')) {
            is480p = true;
            file480p = item['link'];
            notifyListeners();
          }
          if (item['quality'].contains('render_720p_0')) {
            is720p = true;
            file720p = item['link'];
            notifyListeners();
          }
          if (item['quality'].contains('audio_0')) {
            ismp3 = true;
            fileaudio = item['link'];
            notifyListeners();
          }
          if (item['quality'].contains('render_480p')) {
            is480p = true;
            file480p = item['link'];
            notifyListeners();
          }
          if (item['quality'].contains('original')) {
            isonlyhd = true;
            fileonlyhd = item['link'];
            notifyListeners();
          }
          if (item['quality'].contains('540p_lower')) {
            is480p = true;
            file480p = item['link'];
            notifyListeners();
          }
          if (item['quality'].contains('render_360p')) {
            is360p = true;
            file360p = item['link'];
            notifyListeners();
          }
          if (item['quality'].contains('sd_240p')) {
            is244p = true;
            fb240 = item['link'];
            notifyListeners();
          }
          if (item['quality'].contains('render_144p')) {
            is144p = true;
            file144p = item['link'];
            notifyListeners();
          }
          if (item['quality'].contains('audio')) {
            ismp3 = true;
            fileaudio = item['link'];
            notifyListeners();
          }
          if (item['quality'].contains('hd')) {
            isonlyhd = true;
            fileonlyhd = item['link'];
            notifyListeners();
          }
        }
      }

      if (links.isNotEmpty) {
        Toasthelper.Showtoast('Choose Desired Quality');
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return BottomDownloadSheet(context);
          },
        );
      }
    } else {
      Toasthelper.Showtoast('Link Not Supported...');
    }
  }

  void reset() {
    _selectedquality = '';
    _videoname = '';
    _thumbnailimage = '';
    is1080p = false;
    is720p = false;
    is480p = false;
    is360p = false;
    is244p = false;
    is144p = false;
    ismp3 = false;
    isfacebook = false;
    isselaudio = false;
    isinta = false;
    istiktok = false;
    fbaudio = false;
    _links = [];
    file1080p = '';
    hdnowatermark = '';
    no_watermark = '';
    watermark = '';
    mp3 = '';
    fileonlyhd = '';
    file720p = '';
    file480p = '';
    file360p = '';
    file244p = '';
    file144p = '';
    isX = false;
    Xlink = '';
    ishdnowatermark = false;
    fileaudio = '';
    isonlyhd = false;
    isfbhd = false;
    _isloading = false;
    notifyListeners();
    isvimeo = false;
    vimeoLink = '';
  }

  Future<bool> isDownloadable(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      final contentType = response.headers['content-type'];
      return contentType != null &&
          (contentType.startsWith('video/') ||
              contentType.startsWith('audio/') ||
              contentType == 'application/pdf' ||
              contentType == 'application/msword' ||
              contentType ==
                  'application/vnd.openxmlformats-officedocument.wordprocessingml.document');
    } catch (e) {
      return false;
    }
  }

  String Fileextension(String url) {
    if (url.contains('video') || url.contains('mp4')) {
      return 'Video_by_video_downloader.mp4';
    } else if (url.contains('audio') || url.contains('mp3')) {
      return 'Audio_by_video_downloader.mp3';
    } else if (url.contains('word')) {
      return 'document.word';
    } else if (url.contains('pdf')) {
      return 'document.pdf';
    } else if (url.contains('excel')) {
      return 'document.excel';
    } else if (url.contains('docx')) {
      return 'document.docx';
    } else if (url.contains('image') ||
        url.contains('jpg') ||
        url.contains('jpeg') ||
        url.contains('png') ||
        url.contains('webpg')) {
      return 'imgae.jpg';
    } else {
      return 'document.pdf';
    }
  }

  String trimToLength(String str, int maxLength) {
    if (str.length <= maxLength) {
      return str; // No need to trim if the string is already shorter than or equal to maxLength
    } else {
      return str.substring(
          0, maxLength); // Trim the string to maxLength characters
    }
  }

  void ShowotherdownloadbottomSheet(BuildContext context, String url) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: GradientColor(
                child: SizedBox(
                  height: Get.height * 0.29,
                  width: Get.width * 1,
                  child: Consumer<VideoDownloadProvider>(
                    builder: (context, C, child) {
                      return Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'images/folder.png',
                                    height: Get.height * 0.07,
                                    width: Get.width * 0.3,
                                    color: Colors.orange,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      trimToLength(url, 30),
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'OpenSauceOne',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: Get.height * 0.04,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: Get.height * 0.02),
                              child: RoundButton(
                                title: 'Download',
                                ontap: () {
                                  Navigator.pop(context);
                                  EnterDownload(url, Fileextension(url), '');
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  bool Showdownloadbutton(String url) {
    if (url.contains('instagram.com') ||
        url.contains('tiktok') ||
        url.contains('facebook') ||
        url.contains('fb')) {
      return true;
    } else {
      return false;
    }
  }

  bool directdownload(String url) {
    if (url.contains('instagram.com') ||
        url.contains('tiktok') ||
        url.contains('facebook') ||
        url.contains('fb')) {
      return false;
    }
    if (url.contains('mp4') ||
        url.contains('mp3') ||
        url.contains('video') ||
        url.contains('audio') ||
        url.contains('pdf') ||
        url.contains('word') ||
        url.contains('docx') ||
        url.contains('excel') ||
        url.contains('photo') ||
        url.contains('jpg') ||
        url.contains('png') ||
        url.contains('jpeg')) {
      return true;
    } else {
      return false;
    }
  }

  onchanged(String? value, bool enabled) {
    if (enabled) {
      _selectedquality = value ?? '';
      notifyListeners();
    }
  }

  Widget BottomDownloadSheet(BuildContext context) {
    String choice = 'watermark';
    bool noWatermark = true;
    bool withmatermark = true;
    String quality = '';
    return Consumer<VideoDownloadProvider>(builder: (context, value, child) {
      if (value.istiktok) {
        if (noWatermark) {
          quality = 'HD';
        }
        if (withmatermark) {
          quality = '480P';
        }
      }
      if (value.isinta) {
        quality = 'HD';
      }
      if (value.isfacebook) {
        quality = 'HD';
      }
      if (value.isX) {
        quality = 'HD';
      }
      if (value.isvimeo) {
        quality = 'HD';
      }
      String videoname = value.videoname;
      String thumbnail = value.thumbnailimage;
      return GradientColor(
        child: Stack(alignment: Alignment.center, children: [
          SizedBox(
            height: Get.height * 0.53,
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * 0.01),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Gap(5),
                      ThumbnailWidget(thumbnail),
                      Videoname('${value.trimToLength(videoname, 25)}...'),
                    ],
                  ),
                  Underline(),
                  Row(
                    children: [
                      QualityRadioTile(
                          title: '1080P HD',
                          value: 'hd',
                          groupValue: _selectedquality,
                          onChanged: (value) {
                            onchanged(value, isonlyhd ? true : is1080p);
                          },
                          isenabled: isonlyhd ? true : is1080p),
                      QualityRadioTile(
                          title: '720P',
                          value: '720P',
                          groupValue: _selectedquality,
                          onChanged: (value) {
                            onchanged(value, is720p);
                          },
                          isenabled: is720p),
                    ],
                  ),
                  Gap(Get.height * 0.015),
                  Row(
                    children: [
                      QualityRadioTile(
                          title: '480P',
                          value: 'render_480p',
                          groupValue: _selectedquality,
                          onChanged: (value) {
                            onchanged(value, is480p);
                          },
                          isenabled: is480p),
                      QualityRadioTile(
                          title: '360P',
                          value: 'render_360p',
                          groupValue: _selectedquality,
                          onChanged: (value) {
                            onchanged(value, is360p);
                          },
                          isenabled: is360p),
                    ],
                  ),
                  Gap(Get.height * 0.015),
                  Row(
                    children: [
                      QualityRadioTile(
                          title: '244P',
                          value: 'sd_240p',
                          groupValue: _selectedquality,
                          onChanged: (value) {
                            onchanged(value, is244p);
                          },
                          isenabled: is244p),
                      QualityRadioTile(
                          title: '144P',
                          value: 'render_144p',
                          groupValue: _selectedquality,
                          onChanged: (value) {
                            onchanged(value, is144p);
                          },
                          isenabled: is144p),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.25,
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: Get.width * 0.75),
                    child: const HeaderWidget(
                      HeaderImage: 'images/headphone.png',
                      title: 'Audios',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: Get.width * 0.49),
                    child: QualityRadioTile(
                        title: 'MP3',
                        value: 'audio',
                        groupValue: _selectedquality,
                        onChanged: (value) {
                          onchanged(value, ismp3);
                        },
                        isenabled: ismp3),
                  ),
                  // Gap(Get.height * 0002),
                ],
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.39,
            child: DownloadButton('Download', () {
              if (_selectedquality!.isNotEmpty) {
                startdownload(_selectedquality!, context);
              } else {
                Toasthelper.Showtoast('No Qualtiy Choosen');
              }
            }, _selectedquality!.isNotEmpty),
          )
        ]),
      );
    });
  }
}
