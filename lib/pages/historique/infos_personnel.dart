import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoscan_admin/pages/historique/historique_controller.dart';

class InfosPersonnel extends StatelessWidget {
  //
  HistoriqueController historiqueController = Get.find();
  //
  Map d;
  //
  InfosPersonnel(this.d);
  //
  @override
  Widget build(BuildContext context) {
    //
    return Center(
      child: Container(
        width: 400,
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                //
                TextEditingController nom = TextEditingController();
                modifierInfo(d, context, nom, "nom");
              },
              title: Text("Nom"),
              subtitle: Text("${d['nom']}"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              onTap: () {
                //
                TextEditingController postnom = TextEditingController();
                modifierInfo(d, context, postnom, "postnom");
              },
              title: Text("Postnom"),
              subtitle: Text("${d['postnom']}"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              onTap: () {
                //
                TextEditingController prenom = TextEditingController();
                modifierInfo(d, context, prenom, "prenom");
              },
              title: Text("Prenom"),
              subtitle: Text("${d['prenom']}"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              onTap: () {
                //
              },
              title: Text("Date de naissance"),
              subtitle: Text("${d['dateNaissance']}"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              onTap: () {
                //
              },
              title: Text("Date de dèce"),
              subtitle: Text("${d['dateDece']}"),
              trailing: Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }

  //
  modifierInfo(
    Map e,
    BuildContext context,
    TextEditingController text,
    String nom,
  ) async {
    text.text = e[nom];
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text("${nom.capitalize}"),
          contentPadding: const EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 250,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        //prefixIcon: const Icon(Icons.person),
                        hintText: 'nom'.tr,
                        labelText: 'nom'.tr,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'nom_message'.tr;
                        }

                        return null;
                      },
                      onChanged: (value) {
                        //print("Password value $value");
                      },
                    ),
                    InkWell(
                      onTap: () {
                        e[nom] = text.text;
                        Get.dialog(
                          const Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                        historiqueController.putDataDefunt(e);
                        //Mise ) jour ici...
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 2,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 2,
                          ),
                          child: Text(
                            "Enregistrer".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade900,
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                            // ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
