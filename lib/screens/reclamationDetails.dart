import 'package:flutter/material.dart';
import 'package:pdm_backoffice/models/reclamation.dart';

class ReclamationDetails extends StatelessWidget {
  final Recalamtion reclamation;

  ReclamationDetails({required this.reclamation});

  // Fonction pour gérer l'approbation de la réclamation
  void approuverReclamation(BuildContext context) {
    // Mettez ici le code pour approuver la réclamation
    // Vous pouvez appeler une fonction d'approbation depuis votre modèle (ou où vous stockez vos données).
    // Exemple : serviceDApprobation.approuverReclamation(reclamation.id);
    // Vous pouvez également effectuer des actions spécifiques après l'approbation.
  }

  // Fonction pour gérer la suppression de la réclamation
  void supprimerReclamation(BuildContext context) {
    // Mettez ici le code pour supprimer la réclamation
    // Vous pouvez afficher une boîte de dialogue de confirmation avant la suppression
    // et appeler une fonction de suppression depuis votre modèle (ou où vous stockez vos données).
    // Exemple : serviceDeSuppression.supprimerReclamation(reclamation.id);
    // Après la suppression, vous pouvez naviguer vers une autre page, ou fermer celle-ci, etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la réclamation'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tittle : ${reclamation.tittre}'),
                  SizedBox(height: 8),
                  Text('Description : ${reclamation.description}'),
                  SizedBox(height: 16),
                  // Bouton Approuver
                  ElevatedButton(
                    onPressed: () {
                      // Appeler la fonction d'approbation lorsque le bouton est cliqué
                      approuverReclamation(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Couleur de fond verte
                    ),
                    child: Text('Approuver'),
                  ),
                  SizedBox(height: 8),
                  // Bouton Supprimer
                  ElevatedButton(
                    onPressed: () {
                      // Appeler la fonction de suppression lorsque le bouton est cliqué
                      supprimerReclamation(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Couleur de fond rouge (par exemple)
                    ),
                    child: Text('Supprimer'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
