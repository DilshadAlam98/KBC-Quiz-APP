import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/config/app_config.dart';
import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/screen/profile/data_source/user_profile_ds.dart';
import 'package:quiz_app/screen/profile/ui/profile.dart';
import 'package:quiz_app/screen/profile/profile_bloc/bloc.dart';
import 'package:quiz_app/service/auth.dart';
import 'package:quiz_app/service/helper_function.dart';

class SideNavBar extends StatefulWidget {
  String? profileUrl;
  String? name;
  String? money;
  String? level;
  String? rank;

  SideNavBar({
     this.profileUrl,
     this.name,
     this.money,
     this.rank,
     this.level,
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
        color:AppThemeConfig.appBackGroundColour,
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
                     EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!*1.4, vertical: SizeConfig.defaultSize!*1.4),
                child: Row(
                  children: [
                    profile != null
                        ? CircleAvatar(
                            radius: 45,
                            backgroundImage: FileImage(File(profile)),
                          )
                        : CircleAvatar(
                            radius: 45,
                            backgroundImage:CachedNetworkImageProvider(widget.profileUrl.toString())),
                                // NetworkImage(widget.profileUrl.toString())),
                     SizedBox(
                      width:SizeConfig.defaultSize!*1.6,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.name}",
                            style: AppThemeConfig.mainTitle2,
                        ),
                         SizedBox(
                          width: SizeConfig.defaultSize!*1,
                        ),
                        Text(
                          "Rs.${widget.money.toString()}",
                          style: AppThemeConfig.title,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: AppThemeConfig.tittleColor,
              endIndent: 20,
              indent: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                "LeaderBoard-Rank #${widget.rank.toString()}",
                style: AppThemeConfig.mainTitle,
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
    const hoverColor = Colors.white60;
    return ListTile(
        leading: Icon(
          icon,
          color: AppThemeConfig.iconColor,
        ),
        hoverColor: hoverColor,
        title: Text(
          label,
          style:AppThemeConfig.title,
        ),
        onTap: onTap);
  }
}
