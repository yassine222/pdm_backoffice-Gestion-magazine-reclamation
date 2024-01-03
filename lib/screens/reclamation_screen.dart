import 'package:flutter/material.dart';
import 'package:pdm_backoffice/controller/reclamation_controller.dart';
import 'package:pdm_backoffice/models/reclamation_model.dart';
import 'package:pdm_backoffice/screens/reclamation_card.dart';
import 'package:provider/provider.dart';

class ReclamationPage extends StatefulWidget {
  const ReclamationPage({Key? key}) : super(key: key);

  @override
  State<ReclamationPage> createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {
  String selectedStatus = "all";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reclamation"),
      ),
      body: Consumer<ReclamationNotifier>(
        builder: (context, reclamationNotifier, child) {
          reclamationNotifier.getReclamation();
          return Padding(
            padding: const EdgeInsets.all(8),
            child: FutureBuilder(
              future: reclamationNotifier.reclamationList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final reclamations = snapshot.data;
                  final filteredReclamations = _filterReclamations(
                    reclamations!,
                    selectedStatus,
                  );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          value: selectedStatus,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedStatus = newValue!;
                            });
                          },
                          items: <String>["all", "resolved", "pending"]
                              .map<DropdownMenuItem<String>>((String value) {
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
                          itemCount: filteredReclamations.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final reclamation = filteredReclamations[index];

                            return ReclamationCard(
                              title: reclamation.tittre,
                              description: reclamation.description,
                              status: reclamation.statue,
                              createdAt: reclamation.createdAt.timeZoneName,
                              updatedAt: reclamation.updatedAt.timeZoneName,
                              onUpdateStatus: () {
                                reclamationNotifier
                                    .updateReclamation(reclamation.id);
                              },
                              ondelete: () {
                                reclamationNotifier
                                    .deleteReclamation(reclamation.id);
                              },
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

  List<GetAllReclamationRes> _filterReclamations(
    List<GetAllReclamationRes> reclamations,
    String status,
  ) {
    if (status == "all") {
      return reclamations;
    } else {
      return reclamations.where((reclamation) {
        return reclamation.statue == (status == "resolved");
      }).toList();
    }
  }
}
