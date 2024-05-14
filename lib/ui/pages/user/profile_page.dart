import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foody/domain/controllers/user_data.dart';
import 'package:foody/domain/models/user.dart';
import 'package:foody/ui/pages/user/edit/edit_description.dart';
import 'package:foody/ui/pages/user/edit/edit_email.dart';
import 'package:foody/ui/pages/user/edit/edit_image.dart';
import 'package:foody/ui/pages/user/edit/edit_name.dart';
import 'package:foody/ui/pages/user/edit/edit_phone.dart';
import '../widgets/display_image_widget.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final user = UserData.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              elevation: 0,
              toolbarHeight: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(7, 154, 21, 1),
                ),
              ),
              
            ),
            InkWell(
              onTap: () {
                navigateToEditPage(const EditImagePage());
              },
              child: DisplayImage(
                imagePath: user.image,
                onPressed: () {},
              ),
            ),
            buildUserInfoDisplay(user.name, 'Name', const EditNameFormPage()),
            buildUserInfoDisplay(
                user.phone, 'Phone', const EditPhoneFormPage()),
            buildUserInfoDisplay(
                user.email, 'Email', const EditEmailFormPage()),
            buildAbout(user),
          ],
        ),
      ),
    );
  }

  Widget buildUserInfoDisplay(String value, String title, Widget editPage) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 1),
            Container(
              width: 350,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  navigateToEditPage(editPage);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 16, height: 1.4),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildAbout(User user) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tell Us About Yourself',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 1),
            Container(
              width: 350,
              height: 200,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  navigateToEditPage(EditDescriptionFormPage());
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      user.aboutMeDescription,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  void navigateToEditPage(Widget editForm) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => editForm),
    ).then((_) {
      setState(() {
        // Refresh the page after editing
      });
    });
  }
}
