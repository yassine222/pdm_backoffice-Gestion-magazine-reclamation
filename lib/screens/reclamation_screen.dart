import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pdm_backoffice/models/reclamation.dart';
import 'package:pdm_backoffice/screens/magazine_screen.dart';
import 'package:pdm_backoffice/screens/reclamationDetails.dart';

class ReclamationScreen extends StatefulWidget {
  @override
  _ReclamationScreenState createState() => _ReclamationScreenState();
}

class _ReclamationScreenState extends State<ReclamationScreen> {
  List<Recalamtion> reclamations = [
    Recalamtion(
      tittre: "Reclamation1",
      description: "Mauvaise Expérience avec le Service Client",
    ),
    Recalamtion(
      tittre: "Reclamation2",
      description: "Fausse information",
    ),
    Recalamtion(
      tittre: "Reclamation3",
      description: "Erreur",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Réclamations :'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text("Reclamations"),
            ),
            ListTile(
              onTap: () => Get.to(const MagazinePage()),
              title: Text("Magazines"),
            ),
          ],
        ),
      ),
      body: reclamations.isEmpty
          ? Center(
              child: Text('Aucune réclamation pour le moment.'),
            )
          : ListView.builder(
              itemCount: reclamations.length,
              itemBuilder: (context, index) {
                return ReclamationListItem(reclamation: reclamations[index]);
              },
            ),
    );
  }
}

class ReclamationListItem extends StatelessWidget {
  final Recalamtion reclamation;

  ReclamationListItem({required this.reclamation});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(reclamation.tittre),
      subtitle: Text(reclamation.description),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReclamationDetails(reclamation: reclamation),
          ),
        );
      },
    );
  }
}
