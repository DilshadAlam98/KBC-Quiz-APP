import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_app/service/auth.dart';

class SideNavBar extends StatelessWidget {

   SideNavBar({Key? key}) : super(key: key);
FirebaseAuth auth= FirebaseAuth.instance;
   GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.amberAccent,
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Dilshad",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("RS.50000")
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25),
              child: const Text(
                "LeaderBoard- 23th Rank",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ListItem( "Daily Quiz", Icons.quiz,context),
            ListItem("LeadBoard",  Icons.leaderboard,context),
            ListItem( "How to use",  Icons.question_answer,context),
            ListItem( "About us",  Icons.face,context),
            ListItem( "Log out", Icons.logout,context)
          ],
        ),
      ),
    );
  }

  Widget ListItem( String label,  IconData icon, BuildContext context) {
    final color = Colors.white;
    final hoverColor = Colors.white60;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      hoverColor: hoverColor,
      title: Text(
        label,
        style: TextStyle(color: color),
      ),
      onTap: ()async{
        signOutUser(context);
      },
    );
  }
}
