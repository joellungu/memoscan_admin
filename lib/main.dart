import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:memoscan_admin/pages/accueil.dart';
import 'package:window_manager/window_manager.dart';

import 'pages/formulaire/formulaire_controller.dart';
import 'pages/historique/historique_controller.dart';

void main() async {
  //
  GetStorage.init();
  //
  FormulaireController formulaireController = Get.put(FormulaireController());
  //
  HistoriqueController historiqueController = Get.put(HistoriqueController());
  //
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1300, 800),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    fullScreen: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MEMOSCAN ADMIN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: Accueil(),
    );
  }
}
