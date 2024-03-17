import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'formulaire_controller.dart';

class Formulaire2 extends StatelessWidget {
  PageController controller;
  Formulaire2(this.controller);
  //
  FormulaireController formulaireController = Get.find();
  //
  RxString couverture = "".obs;
  RxString profile = "".obs;
  RxString biographie = "".obs;
  RxString accomplissement = "".obs;
  RxList medias = [].obs;
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
                "Couverture",
                style: st,
              ),
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      //
                      getImage(0);
                      //
                    },
                    child: const Text("Ajouter"),
                  ),
                ],
              ),
            ),
            Obx(
              () => couverture.value.isEmpty
                  ? Container()
                  : Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(
                            File(couverture.value),
                          ),
                        ),
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
                "Profile",
                style: st,
              ),
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      //
                      getImage(1);
                      //
                    },
                    child: const Text("Ajouter"),
                  ),
                ],
              ),
            ),
            Obx(
              () => profile.value.isEmpty
                  ? Container()
                  : Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(
                            File(profile.value),
                          ),
                        ),
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
                "Biographie",
                style: st,
              ),
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      biographie.value.split("/").last,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //
                      getFichier(0);
                      //
                    },
                    child: const Text("Ajouter"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Accomplissement",
                style: st,
              ),
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      accomplissement.value.split("/").last,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //
                      getFichier(1);
                      //
                    },
                    child: const Text("Ajouter"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Multi Medias",
            //     style: st,
            //   ),
            // ),
            // Container(
            //   height: 45,
            //   padding: const EdgeInsets.only(left: 10, right: 10),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey.shade700),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       ElevatedButton(
            //         onPressed: () async {
            //           //
            //           getImage(2);
            //           //
            //         },
            //         child: const Text("Ajouter"),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Obx(
            //   () => medias.isEmpty
            //       ? Container()
            //       : GridView.count(
            //           shrinkWrap: true,
            //           crossAxisCount: 2,
            //           crossAxisSpacing: 10,
            //           mainAxisSpacing: 10,
            //           padding: const EdgeInsets.only(right: 30, left: 30),
            //           children: List.generate(
            //             medias.length,
            //             (index) {
            //               return Container(
            //                 alignment: Alignment.center,
            //                 decoration: BoxDecoration(
            //                   color: Colors.grey.shade100,
            //                   borderRadius: BorderRadius.circular(10),
            //                   image: DecorationImage(
            //                     image: FileImage(
            //                       File(
            //                         medias[index],
            //                       ),
            //                     ),
            //                     //AssetImage("assets/car.png"),
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //                 // child: index % 3 == 0
            //                 //     ? const Icon(
            //                 //         Icons.play_circle,
            //                 //         color: Colors.white,
            //                 //         size: 70,
            //                 //       )
            //                 //     : const SizedBox(
            //                 //         height: 0,
            //                 //         width: 0,
            //                 //       ),
            //               );
            //             },
            //           ),
            //         ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    //
                    controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear);
                    //
                    controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear);
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    child: const Text("Retour"),
                  ),
                )
              ],
            ),
            //
            const SizedBox(
              height: 20,
            ),
            //
            ElevatedButton(
              onPressed: () {
                //
                List multiMedias = [];
                medias.forEach((element) {
                  //
                  multiMedias.add({
                    "label": element,
                    "media": File(element).readAsBytesSync()
                  });
                });

                var uuid = Uuid();
                //
                Map e = {
                  "qrcode": uuid.v1(),
                  "nom": formulaireController.nom.value,
                  "postnom": formulaireController.postnom.value,
                  "prenom": formulaireController.prenom.value,
                  "pays": formulaireController.pays.value,
                  "province": formulaireController.province.value,
                  "distrique": formulaireController.distrique.value,
                  "secteur": formulaireController.secteur.value,
                  "village": formulaireController.village.value,
                  "nationalite": formulaireController.nationalite.value,
                  "dateNaissance": formulaireController.dateNaissance.value,
                  "dateDece": formulaireController.dateDece.value,
                  "sitation": formulaireController.sitation.value,
                  //
                  "couverture": File(couverture.value).readAsBytesSync(),
                  "profile": File(profile.value).readAsBytesSync(),
                  "biographie": File(biographie.value).readAsBytesSync(),
                  "accomplissement":
                      File(accomplissement.value).readAsBytesSync(),
                  //
                  // "multiMedias": multiMedias,
                };
                //
                Get.dialog(
                  Center(
                    child: Container(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
                //
                formulaireController.enregistrer(e);
              },
              child: Text("Enregistrer"),
            ),
            //
            const SizedBox(
              height: 20,
            ),
            //

            //
          ],
        ),
      ),
    );
  }

  //
  Future<void> getImage(int i) async {
    final ImagePicker picker = ImagePicker();
    XFile? files = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 800,
      maxWidth: 800,
    );

    if (files != null) {
      if (i == 0) {
        couverture.value = files.path;
      }
      if (i == 1) {
        profile.value = files.path;
      }

      if (i == 2) {
        medias.add(files.path);
      }

      print("couverture: ${couverture.value}");
      //_handleLostFiles(files);
    } else {
      Get.snackbar("Oups", "Aucune image ajouté");
    }
  }

  //
  Future<void> getFichier(int i) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["html", "HTML"],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      //
      if (i == 0) {
        biographie.value = file.path;
      }
      if (i == 1) {
        accomplissement.value = file.path;
      }
    } else {
      // User canceled the picker
      Get.snackbar("Oups", "Aucune fichier ajouté");
    }
  }

  //
  TextStyle st = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
