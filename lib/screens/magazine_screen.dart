import 'package:flutter/material.dart';
import 'package:pdm_backoffice/controller/magazine_controller.dart';
import 'package:pdm_backoffice/models/magazine_model.dart';
import 'package:pdm_backoffice/screens/magazine_card.dart';
import 'package:provider/provider.dart';

class MagazinePage extends StatefulWidget {
  const MagazinePage({Key? key}) : super(key: key);

  @override
  State<MagazinePage> createState() => _MagazinePageState();
}

class _MagazinePageState extends State<MagazinePage> {
  String selectedCategory = "all";

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
                  final magazines = snapshot.data;

                  List<GetAllMagazineRes> filteredMagazines;

                  if (selectedCategory == "all") {
                    filteredMagazines = magazines!;
                  } else {
                    filteredMagazines = magazines!
                        .where((magazine) => magazine.type == selectedCategory)
                        .toList();
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          value: selectedCategory,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                            });
                          },
                          items: <String>[
                            "all",
                            "sport",
                            "nutrution",
                            "medical"
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: filteredMagazines.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final magazine = filteredMagazines[index];

                            return ReelCardWidget(
                              id: magazine.id,
                              title: magazine.titre,
                              description: magazine.description,
                              videoUrl: magazine.videoUrl,
                              postDate: magazine.createdAt,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
