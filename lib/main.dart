import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pdm_backoffice/controller/magazine_controller.dart';
import 'package:pdm_backoffice/controller/reclamation_controller.dart';
import 'package:pdm_backoffice/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MagazineNotifier()),
    ChangeNotifierProvider(create: (context) => ReclamationNotifier()),
  ], child: const DashboardApp()));
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
