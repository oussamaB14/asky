import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../services/user_service.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController usernameEdit = TextEditingController();
  TextEditingController educationEdit = TextEditingController();
  TextEditingController bioEdit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: UserService().getUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator());

          if (snapshot.hasError) return const Text('Error');

          var data = snapshot.data;
          return Card(
            child: Column(
              children: [
                Center(
                  child: Stack(children: [
                    CircleAvatar(
                      radius: 4.h,
                      backgroundImage: NetworkImage(data!['imgUrl']),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: Container(
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(Icons.add_a_photo, color: Colors.black),
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
                ListTile(
                    title: Row(
                      children: [
                        const Text('username  :'),
                        SizedBox(
                          width: 2.h,
                        ),
                        Text(data['name']),
                      ],
                    ),
                    leading: const Icon(Icons.person),
                    trailing: GestureDetector(
                        onTap: () {
                          editButton(usernameEdit, 'username');
                        },
                        child: const Icon(Icons.edit))),
                ListTile(
                    title: const Text('Education filed :'),
                    leading: const Icon(
                        CommunityMaterialIcons.book_education_outline),
                    trailing: GestureDetector(
                        onTap: () {
                          editButton(educationEdit, 'Education filed');
                        },
                        child: const Icon(Icons.edit))),
                ListTile(
                  title: const Text('bio :'),
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
        },
      ),
    );
  }

  void editButton(TextEditingController controller, String labelname) async {
    showModalBottomSheet<void>(
        builder: (BuildContext context) {
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
                        onPressed: () {}, child: const Icon(Icons.check)),
                  )
                ]),
                SizedBox(
                  height: 3.h,
                ),
                TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      label: Text('$labelname'),
                    )),
              ],
            ),
          );
        },
        context: context);
  }
}
