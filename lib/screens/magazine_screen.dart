import 'package:flutter/material.dart';
import 'package:pdm_backoffice/controller/magazine_controller.dart';
import 'package:pdm_backoffice/screens/magazine_card.dart';
import 'package:provider/provider.dart';

class MagazinePage extends StatefulWidget {
  const MagazinePage({super.key});

  @override
  State<MagazinePage> createState() => _MagazinePageState();
}

class _MagazinePageState extends State<MagazinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Magazine"),
      ),
      body: Consumer<MagazineNotifier>(
          builder: (context, magazineNotifier, child) {
        magazineNotifier.getMagazines();
        return Padding(
          padding: const EdgeInsets.all(8),
          child: FutureBuilder(
              future: magazineNotifier.magazineList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final reels = snapshot.data;
                  return ListView.builder(
                      itemCount: reels!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final reel = reels[index];

                        return ReelCardWidget(
                          id: reel.id,
                          title: reel.title,
                          content: reel.postContent,
                          imageUrl: reel.postPicture,
                          likes: reel.likes.length,
                          comments: reel.comments.length,
                          postDate: reel.createdAt,
                          userName: reel.userName,
                          userProfileImageUrl: reel.userImage,
                        );
                      });
                }
              }),
        );
      }),
    );
  }
}
