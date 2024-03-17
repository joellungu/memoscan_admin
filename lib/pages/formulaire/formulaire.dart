import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:memoscan_admin/pages/formulaire/formulaire_1.dart';
import 'package:uuid/uuid.dart';

import 'formulaire_2.dart';
import 'formulaire_controller.dart';

class Formulaire extends StatelessWidget {
  //
  Formulaire() {
    cims = box.read("cimetieres") ?? [];
    print("cims: $cims");
  }
  //
  FormulaireController formulaireController = Get.find();
  //
  String jour = "", mois = "", annee = "";
  //
  String jourD = "", moisD = "", anneeD = "";
  //
  var box = GetStorage();
  //
  List cims = [];
  RxInt cim = 0.obs;
  //
  TextEditingController nom = TextEditingController();
  TextEditingController postnom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  //
  PageController controller = PageController();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(),
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
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 400,
              height: 700,
              child: Column(
                children: [
                  //
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nom",
                      style: st,
                    ),
                  ),
                  TextField(
                    controller: nom,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Postnom",
                      style: st,
                    ),
                  ),
                  TextField(
                    controller: postnom,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Prenom",
                      style: st,
                    ),
                  ),
                  TextField(
                    controller: prenom,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Date Naissance",
                      style: st,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          onChanged: (t) {
                            jour = t;
                          },
                          decoration: InputDecoration(
                            hintText: "Jour",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          onChanged: (t) {
                            mois = t;
                          },
                          decoration: InputDecoration(
                            hintText: "Mois",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: TextField(
                          onChanged: (t) {
                            annee = t;
                          },
                          decoration: InputDecoration(
                            hintText: "Année",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Date de dèces",
                      style: st,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          onChanged: (t) {
                            jourD = t;
                          },
                          decoration: InputDecoration(
                            hintText: "Jour",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          onChanged: (t) {
                            moisD = t;
                          },
                          decoration: InputDecoration(
                            hintText: "Mois",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: TextField(
                          onChanged: (t) {
                            anneeD = t;
                          },
                          decoration: InputDecoration(
                            hintText: "Année",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      onChanged: (c) {
                        //
                        cim.value = c as int;
                        //
                      },
                      value: cim.value,
                      items: List.generate(cims.length, (index) {
                        //
                        Map ci = cims[index];
                        //
                        return DropdownMenuItem(
                          value: index,
                          child: Text("${ci['nom']}"),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      //
                      Get.dialog(
                        Center(
                          child: Container(
                            height: 40,
                            width: 40,
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      );
                      //
                      formulaireController.nom.value = nom.text;
                      formulaireController.postnom.value = postnom.text;
                      formulaireController.prenom.value = prenom.text;
                      formulaireController.dateNaissance.value =
                          "$jour-$mois-$annee";
                      formulaireController.dateDece.value =
                          "$jourD-$moisD-$anneeD";
                      //
                      var uuid = Uuid();
                      //
                      Map e = {
                        "qrcode": uuid.v1(),
                        "nom": formulaireController.nom.value,
                        "postnom": formulaireController.postnom.value,
                        "prenom": formulaireController.prenom.value,
                        "dateNaissance":
                            formulaireController.dateNaissance.value,
                        "dateDece": formulaireController.dateDece.value,
                        "idAcces": codeDefunt(),
                        "photoProfile": false,
                        "cimetiere": "${cims[cim.value]['nom']}",
                        "adresseCimetiere": "${cims[cim.value]['adresse']}",
                      };
                      formulaireController.enregistrer(e);
                      //
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      child: const Text("Enregistrer"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //
  String codeDefunt() {
    var r = Random();
    DateTime d = DateTime.now();
    String code =
        "${d.year}${d.month}${d.day}${d.hour}${d.minute}${d.second}${d.millisecond}";

    return code;
  }

  //
  TextStyle st = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
