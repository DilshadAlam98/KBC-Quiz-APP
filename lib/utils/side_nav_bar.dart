import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/profile/data_source/user_profile_ds.dart';
import 'package:quiz_app/screen/profile/profile.dart';
import 'package:quiz_app/screen/profile/profile_bloc/bloc.dart';
import 'package:quiz_app/service/auth.dart';
import 'package:quiz_app/service/local_db.dart';

class SideNavBar extends StatefulWidget {
  String profileUrl;
  String name;
  String money;
  String level;
  String rank;

  SideNavBar({
    required this.profileUrl,
    required this.name,
    required this.money,
    required this.rank,
    required this.level,
  });

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  var profile;

  void getImageData() async {
    profile = await Helper.getLocalProfilePic();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageData();
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
                  getImageData();
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    profile != null
                        ? CircleAvatar(
                            radius: 45,
                            backgroundImage: FileImage(File(profile)),
                          )
                        : CircleAvatar(
                            radius: 45,
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
