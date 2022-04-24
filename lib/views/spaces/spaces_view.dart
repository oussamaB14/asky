import 'package:asky/models/Space.dart';
import 'package:asky/services/SpaceService.dart';
import 'package:asky/styles/colors.dart';
import 'package:asky/views/spaces/widgets/SpaceDrawer.dart';
import 'package:asky/views/spaces/widgets/space_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../QuestionViews/widgets/QuestionButton.dart';

class SpacesView extends StatefulWidget {
  const SpacesView({Key? key}) : super(key: key);

  @override
  State<SpacesView> createState() => _SpacesViewState();
}

class _SpacesViewState extends State<SpacesView> {
  TextEditingController _searchController = TextEditingController();
  SpcaeService _spaceServices = SpcaeService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('spaces'),
          automaticallyImplyLeading: false,
        ),
        endDrawer: SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(15),
              height: 25.h,
              child: SpaceDrawer(),
            ),
          ),
        ),
        floatingActionButton: questionButton(),
        body: SingleChildScrollView(
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: <Widget>[
                      Text(
                        'Recent Spaces',
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyLarge),
                      ),
                      SizedBox(height: 1.5.h),
                      TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide(color: MyColors.black),
                              gapPadding: 15,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide(color: Colors.blue),
                              gapPadding: 10,
                            ),
                          )),
                      // FutureBuilder<List<Space>>(
                      //     future: _spaceServices.getAllSpaces(),
                      //     builder: (context, snapshot) {
                      //       switch (snapshot.connectionState) {
                      //         case ConnectionState.waiting:
                      //           return const Center(
                      //             child: SizedBox(
                      //               child: CircularProgressIndicator(),
                      //             ),
                      //           );
                      //         case ConnectionState.done:
                      //           return Column(
                      //               children: List.generate(
                      //                   snapshot.data!.length,
                      //                   (index) => SpaceCard(
                      //                       space: snapshot.data![index])));

                      //         default:
                      //           return Text("Error");
                      //       }
                      //     }),
                      FutureBuilder(
                          future: Future.wait([_spaceServices.getAllSpaces()]),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<dynamic>> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                    child: CircularProgressIndicator());
                              case ConnectionState.done:
                                return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                          child: Card(
                                        elevation: 20.0,
                                        child: Column(children: [
                                          Row(
                                            children: [
                                              SpaceCard(
                                                  space: snapshot.data![index])
                                            ],
                                          )
                                        ]),
                                      ));
                                    });
                              default:
                                return Text("Error");
                            }
                          })
                    ])))));
  }
}
