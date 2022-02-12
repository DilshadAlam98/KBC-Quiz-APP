import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_app/screen/profile/profile.dart';
import 'package:quiz_app/service/auth.dart';

class SideNavBar extends StatelessWidget {
  String? name;
  String? profileUrl;
  String? rank;
  String? level;
  String? money;

  SideNavBar({this.name, this.profileUrl, this.level, this.rank, this.money});

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.amberAccent,
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(
                        name: name,
                        rank: rank,
                        level: level,
                        profileUrl: profileUrl,
                      ),
                    ));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(profileUrl.toString()),
                      radius: 40,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$name",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Rs.${money.toString()}")
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                "LeaderBoard-Rank #${rank.toString()}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 40,
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
          style:const TextStyle(color: color),
        ),
        onTap: onTap);
  }
}
