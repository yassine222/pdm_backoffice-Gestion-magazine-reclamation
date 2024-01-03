import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_backoffice/helper/reclamation_helper.dart';
import 'package:pdm_backoffice/models/reclamation_model.dart';

class ReclamationNotifier extends ChangeNotifier {
  late Future<List<GetAllReclamationRes>> reclamationList;

  getReclamation() {
    reclamationList = MagazineHelper.getReclamation();
  }

  deleteReclamation(String postId) {
    MagazineHelper.deleteReclamation(postId).then((response) {
      if (response) {
        Get.snackbar("Reclamation successfully deleted", "",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            icon: const Icon(Icons.done));
        html.window.location.reload();
      } else if (!response) {
        Get.snackbar("Failed to delete Reclamation", "Please try again",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.bookmark_remove_outlined));
      }
    });
  }

  updateReclamation(String postId) {
    MagazineHelper.updateReclamation(postId).then((response) {
      if (response) {
        Get.snackbar("Reclamation successfully updated", "",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            icon: const Icon(Icons.done));
        html.window.location.reload();
      } else if (!response) {
        Get.snackbar("Failed to update Reclamation", "Please try again",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.bookmark_remove_outlined));
      }
    });
  }
}
