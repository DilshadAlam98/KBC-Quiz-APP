import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_app/screen/profile/profile.dart';
import 'package:quiz_app/service/auth.dart';
import 'package:quiz_app/service/local_db.dart';

class SideNavBar extends StatefulWidget {
  String? name;
  String? profileUrl;
  String? rank;
  String? level;
  String? money;

  SideNavBar({this.name, this.profileUrl, this.level, this.rank, this.money});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  String? profileImage;

  void getImageDetails() async {
    profileImage = await LocalDb.getLocalProfilePic();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.blue,
        child: ListView(
          children: [
            GestureDetector(
              onTap: () async {
                var shouldRefresh = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(
                        name: widget.name,
                        rank: widget.rank,
                        level: widget.level,
                        profileUrl: widget.profileUrl,
                      ),
                    ));
                if (shouldRefresh == true) {
                  getImageDetails();
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    profileImage != null
                        ? CircleAvatar(
                            radius: 40,
                            backgroundImage: FileImage(File(profileImage!)),
                          )
                        : CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                NetworkImage(widget.profileUrl.toString())),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.name}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Rs.${widget.money.toString()}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.yellow,
              endIndent: 20,
              indent: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                "LeaderBoard-Rank #${widget.rank.toString()}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.yellow,
              endIndent: 20,
              indent: 20,
            ),
            ListItem(
              label: "Daily Quiz",
              icon: Icons.quiz,
              context: context,
              onTap: () {},
            ),
            ListItem(
                label: "LeadBoard",
                icon: Icons.leaderboard,
                context: context,
                onTap: () {}),
            ListItem(
                label: "How to use",
                icon: Icons.question_answer,
                context: context,
                onTap: () {}),
            ListItem(
                label: "About us",
                icon: Icons.face,
                context: context,
                onTap: () {}),
            ListItem(
                label: "Log out",
                icon: Icons.logout,
                context: context,
                onTap: () {
                  signOutUser(context);
                })
          ],
        ),
      ),
    );
  }

  Widget ListItem(
      {required String label,
      required IconData icon,
      required BuildContext context,
      required VoidCallback onTap}) {
    const color = Colors.white;
    const hoverColor = Colors.white60;
    return ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        hoverColor: hoverColor,
        title: Text(
          label,
          style: const TextStyle(color: color),
        ),
        onTap: onTap);
  }
}
