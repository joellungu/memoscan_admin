import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:memoscan_admin/utils/requete.dart';

import 'infos_personnel.dart';
import 'multimedia.dart';
import 'profile.dart';

class DetailsDefunt extends StatelessWidget {
  //
  Map d;
  //
  DetailsDefunt(this.d);
  //
  @override
  Widget build(BuildContext context) {
    //
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${d['nom']} ${d['postnom']} ${d['prenom']}"),
          centerTitle: true,
          actions: [
            Container(
              padding: const EdgeInsets.all(2),
              height: 46,
              width: 46,
              child: d['photoProfile']
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        //color: Colors.indigo,
                        image: DecorationImage(
                          image: NetworkImage(
                            "${Requete.url}/defunt/profile/${d['id']}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(),
            )
          ],
        ),
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
            Column(
              children: [
                const TabBar(
                  isScrollable: true,
                  automaticIndicatorColorAdjustment: true,
                  tabAlignment: TabAlignment.center,
                  tabs: [
                    Tab(
                      child: Text("Infos. Personnelles"),
                    ),
                    Tab(
                      child: Text("Autres infos"),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: TabBarView(
                    children: [
                      InfosPersonnel(d),
                      Profile(d),
                    ],
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
}
