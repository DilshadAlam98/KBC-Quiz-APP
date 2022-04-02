import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/config/app_config.dart';
import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/service/helper_function.dart';

class Profile extends StatefulWidget {
  String? name;
  String? profileUrl;
  String? rank;
  String? level;
  String? money;

  Profile({this.name, this.profileUrl, this.level, this.rank, this.money});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? profileImage;
  bool shouldRefresh = true;

  void getImageDetails() async {
    profileImage = await Helper.getLocalProfilePic();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeConfig.appBarColor,
        title: const Text("Profile"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(shouldRefresh);
          },
        ),
        actions: const [Icon(Icons.share)],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 3.2,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  color: AppThemeConfig.appBackgrounfColor2),
              child: Column(
                children: [
                  Stack(
                    children: [
                      profileImage != null
                          ? CircleAvatar(
                              radius: 55,
                              backgroundImage: FileImage(File(profileImage!)),
                            )
                          : CircleAvatar(
                              radius: 55,
                              backgroundImage: CachedNetworkImageProvider(
                                  widget.profileUrl.toString())),
                      Positioned(
                        bottom: 5.0,
                        right: 0.0,
                        child: InkWell(
                          onTap: () {
                            modelBottomSheet(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppThemeConfig.buttonColor),
                            child: Icon(
                              Icons.edit,
                              color: AppThemeConfig.iconColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.name.toString(),
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  const Divider(
                    thickness: 1,
                    endIndent: 20,
                    indent: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.level.toString(),
                            style: TextStyle(
                                color: AppThemeConfig.tittleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: getFont(27)),
                          ),
                          Text(
                            "Level",
                            style: AppThemeConfig.title,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "#${widget.rank}",
                            style: TextStyle(
                                color: AppThemeConfig.tittleColor,
                                fontSize: getFont(27)),
                          ),
                          Text("Rank", style: AppThemeConfig.title),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: SizeConfig.defaultSize! * 2),
            Text(
              "---------------Leader Board---------------",
              style: AppThemeConfig.mainTitle,
            ),
            SizedBox(height: SizeConfig.defaultSize! * 1.3),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      children: [
                        profileImage != null
                            ? CircleAvatar(
                                radius: 25,
                                backgroundImage: FileImage(File(profileImage!)),
                              )
                            : CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    NetworkImage(widget.profileUrl.toString())),
                        SizedBox(
                          width: 10,
                        ),
                        Text(widget.name ?? "", style: AppThemeConfig.detail),
                      ],
                    ),
                    leading: Text(
                      "#${index + 1}",
                      style: AppThemeConfig.detail,
                    ),
                    trailing: Text(
                      (2000 / (index + 1)).toString().substring(0, 5),
                      style: AppThemeConfig.detail,
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
                clipBehavior: Clip.none,
                style: ElevatedButton.styleFrom(
                    primary: AppThemeConfig.buttonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {},
                child: Text("Show Position"))
          ],
        ),
      ),
    );
  }

  Future<dynamic> modelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: AppThemeConfig.buttomSheetColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text(
              "Image from Camera",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            trailing: const Icon(
              Icons.camera,
              color: Colors.white,
              size: 30,
            ),
            onTap: () async {
              await _getFromCamera();
            },
          ),
          ListTile(
            title: const Text(
              "Image from Gallery",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            trailing: const Icon(
              Icons.photo,
              color: Colors.white,
              size: 30,
            ),
            onTap: () async {
              await _getFromGallery();
            },
          ),
        ],
      ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      Helper.saveLocalProfilePic(pickedFile.path);
      getImageDetails();
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      Helper.saveLocalProfilePic(pickedFile.path);
      getImageDetails();
    }
  }
}
