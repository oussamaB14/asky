import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../services/user_service.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController usernameEdit = TextEditingController();
  late TextEditingController educationEdit = TextEditingController();
  late TextEditingController bioEdit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          UserService().updateUserProfile(
            Provider.of<UserProfileInfoProvider>(context, listen: false).name,
            Provider.of<UserProfileInfoProvider>(context, listen: false)
                .educationFiled,
            Provider.of<UserProfileInfoProvider>(context, listen: false).bio,
          );
          Provider.of<UserProfileInfoProvider>(context, listen: false)
              .resetValues();
          Navigator.of(context).pop();
        }),
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator());

          if (snapshot.hasError) return const Text('Error');

          var data = snapshot.data;
          final usernameEdit = TextEditingController(text: data['name']);
          final educationEdit =
              TextEditingController(text: data['educationFiled']);
          final bioEdit = TextEditingController(text: data['bio']);
          String value1 = data['name'];
          String value2 = data['educationFiled'];
          String value3 = data['bio'];

          return Consumer<UserProfileInfoProvider>(
              builder: (context, prov, child) {
            return Card(
              child: Column(
                children: [
                  Center(
                    child: Expanded(
                      child: Stack(fit: StackFit.passthrough, children: [
                        CircleAvatar(
                          radius: 4.h,
                          backgroundImage: NetworkImage(data!['imgUrl']),
                        ),
                        Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          width: 44.0,
                          height: 44.0,
                          child: Container(
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child:
                                  Icon(Icons.add_a_photo, color: Colors.black),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    50,
                                  ),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(2, 4),
                                    color: Colors.black.withOpacity(
                                      0.3,
                                    ),
                                    blurRadius: 3,
                                  ),
                                ]),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  ListTile(
                      title: Row(
                        children: [
                          Text('username : ' +
                              (prov.name.isEmpty ? value1 : prov.name)),
                          SizedBox(
                            width: 2.h,
                          ),
                          // Text(data['name']),
                        ],
                      ),
                      leading: const Icon(Icons.person),
                      trailing: GestureDetector(
                          onTap: () {
                            editButton(
                              usernameEdit,
                              'username',
                            );
                          },
                          child: const Icon(Icons.edit))),
                  ListTile(
                      title: Text('Education filed : ' +
                          (prov.educationFiled.isEmpty
                              ? value2
                              : prov.educationFiled)),
                      leading: const Icon(
                          CommunityMaterialIcons.book_education_outline),
                      trailing: GestureDetector(
                          onTap: () {
                            editButton(educationEdit, 'Education filed');
                          },
                          child: const Icon(Icons.edit))),
                  ListTile(
                    title:
                        Text('bio : ' + (prov.bio.isEmpty ? value3 : prov.bio)),
                    leading: const Icon(Icons.format_align_center),
                    trailing: GestureDetector(
                        onTap: () {
                          editButton(bioEdit, 'bio');
                        },
                        child: const Icon(Icons.edit)),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }

  void editButton(
    TextEditingController controller,
    String labelname,
  ) async {
    showModalBottomSheet<void>(
        builder: (BuildContext context) {
          return Consumer<UserProfileInfoProvider>(
              builder: (context, prov, child) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              height: 55.h,
              child: Column(
                children: [
                  Row(children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.close)),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: TextButton(
                          onPressed: () {
                            if (labelname == 'username') {
                              prov.updateName(controller.text);
                            } else if (labelname == 'Education filed') {
                              prov.updateEducation(controller.text);
                            } else {
                              prov.updateBio(controller.text);
                            }
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.check)),
                    )
                  ]),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        label: Text(labelname),
                      )),
                ],
              ),
            );
          });
        },
        context: context);
  }
}

class UserProfileInfoProvider with ChangeNotifier {
  String name = '';
  String educationFiled = '';
  String bio = '';

  resetValues() {
    name = '';
    educationFiled = '';
    bio = '';
  }

  updateName(String value) {
    name = value;
    notifyListeners();
  }

  updateBio(String value) {
    bio = value;
    notifyListeners();
  }

  updateEducation(String value) {
    educationFiled = value;
    notifyListeners();
  }
}
