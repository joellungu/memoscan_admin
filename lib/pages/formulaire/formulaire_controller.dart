//import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:memoscan_admin/utils/requete.dart';

class FormulaireController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  //final dio = Dio();
  //
  RxString nom = "".obs;
  RxString postnom = "".obs;
  RxString prenom = "".obs;
  RxString pays = "".obs;
  RxString province = "".obs;
  RxString distrique = "".obs;
  RxString secteur = "".obs;
  RxString village = "".obs;
  RxString dateNaissance = "".obs;
  RxString dateDece = "".obs;
  RxString nationalite = "".obs;
  RxString sitation = "".obs;
  var couverture;
  var profile;

  RxString biographie = "".obs;

  RxString accomplissement = "".obs;
  //
  RxList<Map> multiMedias = RxList();
  //
  Future<void> enregistrer(Map e) async {
    //
    print('Requete: ${Requete.url}/defunt');
    //
    print('Map: $e');
    //final response = await dio.post('${Requete.url}/defunt', data: e);

    //
    Response response = await requete.postE("defunt", e);
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      //
      Get.back();
      Get.snackbar("Succès", "L'enregistrement a bien été éffectué");
    } else {
      //
      print('Erreur: ${response.statusCode} | ${response.body}');
      Get.back();
      Get.snackbar("Erreur", "Code: ${response.statusCode} | ${response.body}");
    }
  }
  //
  // saveFichier(String id, Uint8List file) async {
  //   //
  //   //Response response = await requete.postE("niveau/$id", file);
  //   io.Dio dio = io.Dio();
  //   dio.post(
  //     "${Requete.url}/niveau/$id",
  //     data: file,
  //     options: io.Options(method: "POST", contentType: "*/*"),
  //     onSendProgress: (received, total) {
  //       int percentage = ((received / total) * 100)
  //           .floor(); //this is what I want to listen to from my ViewModel class
  //       pr.value = percentage;
  //       print("le pourcent: $percentage");
  //     },
  //   );
  // }
}
