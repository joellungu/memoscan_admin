import 'package:get/get.dart';
import 'package:memoscan_admin/utils/requete.dart';

class HistoriqueController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  RxString defunt = "".obs;
  RxString date = "".obs;
  //
  getDefunt(String nom) async {
    //
    Response response = await requete.getE("defunt/by/$nom");
    //
    if (response.isOk) {
      print("data: ${response.body}");
      //
      change(response.body, status: RxStatus.success());
    } else {
      print("data erreur: ${response.statusCode} :: ${response.body}");
      //
      change([], status: RxStatus.empty());
    }
  }

  //
  getDefunts(String nom, String date) async {
    //
    Response response = await requete.getE("defunt/$nom/$date");
    //
    if (response.isOk) {
      print("data: ${response.body}");
      //
      change(response.body, status: RxStatus.success());
    } else {
      print("data erreur: ${response.statusCode} :: ${response.body}");
      //
      change([], status: RxStatus.empty());
    }
  }

  putDataDefunt(Map e) async {
    Response rep = await requete.putE("defunt", e);
    if (rep.isOk) {
      //

      Get.back();
      Get.back();
      Get.snackbar("Succès", "Mise à jour reussi.");
    } else {
      //
      Get.back();
      Get.snackbar("Erreur", "Mise à jour non abouti.");
    }
  }
}
