import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:memoscan_admin/pages/historique/historique_controller.dart';
import 'package:memoscan_admin/utils/requete.dart';

import 'details_defunt.dart';

class Historique extends GetView<HistoriqueController> {
  //
  Historique() {
    //
    controller.getDefunt("");
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return controller.obx(
      (state) {
        List liste = state!;
        return Center(
          child: Container(
            width: 400,
            child: ListView(
              padding: EdgeInsets.only(left: 20, right: 20),
              children: List.generate(liste.length, (index) {
                //
                Map d = liste[index];
                //
                return ListTile(
                  onTap: () {
                    //
                    Get.to(DetailsDefunt(d));
                    //
                  },
                  leading: d['photoProfile']
                      ? Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            //color: Colors.indigo,
                            image: DecorationImage(
                              image: NetworkImage(
                                "${Requete.url}/defunt/profile/${d['id']}",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          child: const Icon(Icons.person),
                        ),
                  title: Text("${d['nom']} ${d['postnom']} ${d['prenom']}"),
                  subtitle: Text("${d['dateDece']}"),
                );
              }),
            ),
          ),
        );
      },
      onEmpty: Container(),
      onError: (error) {
        return Center(
          child: Text("$error"),
        );
      },
      onLoading: const Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
  //
}
