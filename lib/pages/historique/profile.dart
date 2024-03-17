import 'package:flutter/material.dart';
import 'package:memoscan_admin/utils/requete.dart';

class Profile extends StatelessWidget {
  Map d;
  //
  Profile(this.d) {
    //
    print("Accomplissement: ${d['accomplissement']}");
  }
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
              },
              title: const Text("QR-Code"),
              subtitle: Text("${d['qrcode']}"),
              //trailing: Icon(Icons.edit),
            ),
            ListTile(
              onTap: () {
                //
              },
              title: Text("Code defunt"),
              subtitle: Text("${d['idAcces']}"),
              trailing: Icon(Icons.sync),
            ),
            ListTile(
              onTap: () {
                //
              },
              title: Text("Cimetière"),
              subtitle: Text("${d['cimetiere']}"),
              //trailing: Icon(Icons.edit),
            ),
            ListTile(
              onTap: () {
                //
              },
              title: Text("Adresse cimetière"),
              subtitle: Text("${d['adresseCimetiere'] ?? ''}"),
              //trailing: Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
