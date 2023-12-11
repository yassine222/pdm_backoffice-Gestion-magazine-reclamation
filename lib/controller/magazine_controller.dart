import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_backoffice/helper/magazine_helper.dart';
import 'package:pdm_backoffice/models/magazine_model.dart';

class MagazineNotifier extends ChangeNotifier {
  late Future<List<GetAllMagazineRes>> magazineList;

  getMagazines() {
    magazineList = MagazineHelper.getMagazines();
  }

  deleteMagazine(String postId) {
    MagazineHelper.deleteMagazine(postId).then((response) {
      if (response) {
        Get.snackbar("Magazine successfully deleted", "",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            icon: const Icon(Icons.done));
        html.window.location.reload();
      } else if (!response) {
        Get.snackbar("Failed to delete Magazine", "Please try again",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.bookmark_remove_outlined));
      }
    });
  }
}
