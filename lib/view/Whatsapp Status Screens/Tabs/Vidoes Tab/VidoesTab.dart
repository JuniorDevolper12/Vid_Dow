import "dart:io";

import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shimmer/shimmer.dart";

import "../../../../Provider/Whatsapp Status Providers/Get Status/get_status_provider.dart";
import "../../../../utils/App Helpers/Navbarhelper/GowithNavbar.dart";
import "../../../../utils/App Helpers/Thumnails Helper/getThumbnails.dart";
import "../../View Status/Video View/status_video_view.dart";

class VidoesTab extends StatefulWidget {
  const VidoesTab({super.key});

  @override
  State<VidoesTab> createState() => _VidoesTabState();
}

class _VidoesTabState extends State<VidoesTab> {
  bool _isFetch = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<GetStatusProvider>(
      builder: (context, fileProvider, child) {
        if (!_isFetch) {
          fileProvider.getStatus(".mp4");
          _isFetch = true;
        }

        if (!fileProvider.isWhatsappOn) {
          return const Center(
            child: Text('WhatsApp not Available'),
          );
        }

        if (fileProvider.getVideos.isEmpty) {
          return const Center(
            child: Text("No Videos Found"),
          );
        }

        return Container(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: fileProvider.getVideos.length,
            itemBuilder: (context, index) {
              final data = fileProvider.getVideos[index];
              return FutureBuilder<String>(
                future: getThumbnails(data.path),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GestureDetector(
                      onTap: () {
                        Navhelper.GoWithNavbar(
                            context,
                            StatusVideoViewScreen(
                              videoPath: data.path,
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: FileImage(File(snapshot.data!)),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          )),
                    );
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
