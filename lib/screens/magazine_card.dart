import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:pdm_backoffice/controller/magazine_controller.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ReelCardWidget extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  final DateTime postDate;

  const ReelCardWidget({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.postDate,
  });

  @override
  State<ReelCardWidget> createState() => _ReelCardWidgetState();
}

class _ReelCardWidgetState extends State<ReelCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: 800,
      child: Consumer<MagazineNotifier>(
          builder: (context, magazineNotifier, child) {
        return Card(
          color: Colors.green,
          elevation: 3,
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post Image
              widget.videoUrl.isNotEmpty
                  ? SizedBox(
                      height: 300,
                      width: 800,
                      child: Chewie(
                        controller: ChewieController(
                          videoPlayerController:
                              VideoPlayerController.network(widget.videoUrl),
                          autoPlay: false,
                          looping: true,
                        ),
                      ),
                    )
                  : Container(),

              // Post Title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              // Post Content
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.description),
              ),

              // Post Details (Likes, Comments, Date)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date: ${widget.postDate.toLocal()}'),
                  ],
                ),
              ),

              // User Information (Name, Profile Image)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () =>
                          magazineNotifier.deleteMagazine(widget.id),
                      icon: const Icon(Icons.delete_forever))
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
