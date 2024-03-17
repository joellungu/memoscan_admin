import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:memoscan_admin/pages/historique/historique_controller.dart';

import 'cimetiere/cimetiere.dart';
import 'formulaire/formulaire.dart';
import 'historique/historique.dart';

class Accueil extends StatelessWidget {
  //
  HistoriqueController historiqueController = Get.find();
  //
  RxString nom = "".obs;
  RxString date = "".obs;
  //
  RxString jour = "".obs;
  RxString mois = "".obs;
  RxString annee = "".obs;
  //
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              //color: Colors.white,
              image: DecorationImage(
                image: ExactAssetImage("assets/3254647.jpg"),
                //AssetImage("assets/car.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: SizedBox(
                width: Get.size.width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: TextField(
                        onChanged: (t) {
                          //
                          nom.value = t;
                          //
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        onChanged: (t) {
                          //
                          jour.value = t;
                          //
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        onChanged: (t) {
                          //
                          mois.value = t;
                          //
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        onChanged: (t) {
                          //
                          annee.value = t;
                          //
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //
                        date.value =
                            "${jour.value}-${mois.value}-${annee.value}";
                        //
                        if (date.value.isNotEmpty) {
                          //
                          historiqueController.getDefunts(
                              nom.value, date.value);
                        } else {
                          //
                          historiqueController.getDefunt(nom.value);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        child: const Text("Recherche"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Historique(),
            ),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "cimetière",
            onPressed: () {
              //
              Get.to(Cimetiere());
              //
            },
            child: const Icon(Icons.close),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: "defunt",
            onPressed: () {
              //
              Get.to(Formulaire());
              //
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
  //
}
