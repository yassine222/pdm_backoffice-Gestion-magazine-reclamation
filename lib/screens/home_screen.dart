import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_backoffice/screens/magazine_screen.dart';
import 'package:pdm_backoffice/screens/reclamation_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const MagazinePage());
              },
              child: const ListTile(
                leading: Icon(Icons.library_books),
                title: Text('Magazine'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const ReclamationPage());
              },
              child: const ListTile(
                leading: Icon(Icons.feedback),
                title: Text('Reclamation'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
