import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:pdm_backoffice/controller/magazine_controller.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ReelCardWidget extends StatefulWidget {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final int likes;
  final int comments;
  final DateTime postDate;
  final String userName;
  final String userProfileImageUrl;

  const ReelCardWidget({
    super.key,
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.postDate,
    required this.userName,
    required this.userProfileImageUrl,
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
              widget.imageUrl.isNotEmpty
                  ? SizedBox(
                      height: 300,
                      width: 800,
                      child: Chewie(
                        controller: ChewieController(
                          videoPlayerController:
                              VideoPlayerController.network(widget.imageUrl),
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
                child: Text("test test ofhowhfwh ofhwo hf"),
              ),

              // Post Details (Likes, Comments, Date)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Likes: ${widget.likes}'),
                    Text('Date: ${widget.postDate.toLocal()}'),
                  ],
                ),
              ),

              // User Information (Name, Profile Image)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.userProfileImageUrl),
                      radius: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(widget.userName),
                  ],
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
