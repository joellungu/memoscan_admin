import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Cimetiere extends StatelessWidget {
  //
  var box = GetStorage();
  //
  RxList cimetieres = [].obs;
  //
  Cimetiere() {
    //
    cimetieres.value = box.read("cimetieres") ?? [];
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Obx(
            () => ListView(
              padding: EdgeInsets.all(10),
              children: List.generate(
                cimetieres.length,
                (index) {
                  //
                  Map cim = cimetieres[index];
                  //
                  return ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: const Text("R.I.P"),
                    ),
                    title: Text(
                      "${cim['nom']}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "${cim['nom']}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          //
                          cimetieres.removeAt(index);
                          box.write("cimetieres", cimetieres.value);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
          TextEditingController nom = TextEditingController();
          TextEditingController adresse = TextEditingController();
          //
          Get.dialog(Center(
            child: Card(
              elevation: 1,
              child: Container(
                padding: EdgeInsets.all(20),
                height: 320,
                width: 520,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text("Nouveau cimétière"),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextField(
                        controller: nom,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextField(
                        controller: adresse,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          //
                          cimetieres.value = box.read("cimetieres") ?? [];
                          cimetieres.add(
                            {
                              "nom": nom.text,
                              "adresse": adresse.text,
                            },
                          );
                          //
                          box.write("cimetieres", cimetieres.value);
                          //
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigo),
                        ),
                        child: Container(
                          height: 48,
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Enregistrer",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
  //
}
