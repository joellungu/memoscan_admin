import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'formulaire_controller.dart';

class Formulaire1 extends StatelessWidget {
  PageController controller;
  Formulaire1(this.controller);
  //
  FormulaireController formulaireController = Get.find();
  //
  String jour = "", mois = "", annee = "";
  //
  String jourD = "", moisD = "", anneeD = "";
  //
  TextEditingController nom = TextEditingController();
  TextEditingController postnom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Center(
      child: Container(
        width: 400,
        child: ListView(
          padding: EdgeInsets.all(10),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    //
                    formulaireController.nom.value = nom.text;
                    formulaireController.postnom.value = postnom.text;
                    formulaireController.prenom.value = prenom.text;
                    formulaireController.dateNaissance.value =
                        "$jour-$mois-$annee";
                    formulaireController.dateDece.value =
                        "$jourD-$moisD-$anneeD";
                    //
                    controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear);
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    child: const Text("Suivant"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  //
  TextStyle st = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
