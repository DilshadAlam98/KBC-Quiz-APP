import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/profile/model/model.dart';
import 'package:quiz_app/screen/profile/profile_bloc/bloc.dart';
import 'package:quiz_app/service/local_db.dart';
import 'package:quiz_app/utils/permission_handeler.dart';
import 'package:quiz_app/utils/side_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PermissionHandler permissionHandler=PermissionHandler();

  UserProfileBloc userProfileBloc=UserProfileBloc();
  @override
  void initState() {
    super.initState();
    userProfileBloc.fetchUserData();
    permissionHandler.requestStorafePermission();
    permissionHandler.requestCameraPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: StreamBuilder<UserModel?>(
        stream: userProfileBloc.userModel,
        builder: (context, snapshot) =>SideNavBar(
          money: snapshot.data?.amount??"",
          name: snapshot.data?.name??'',
          profileUrl:snapshot.data?.photoUrl??"",
          level: snapshot.data?.level??"",
          rank:snapshot.data?.rank??"",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              CarouselSlider(
                  items: [
                    _slider(
                        img:
                            "https://images.unsplash.com/photo-1644049335447-298f557ff21a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"),
                  ],
                  options: CarouselOptions(
                      height: 180,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8)),
              Container(
                child: Row(
                  children: [
                    flexible(),
                    flexible(),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    flexible(),
                    flexible(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            "https://images.unsplash.com/photo-1644049335447-298f557ff21a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          color: Colors.black26,
                        ),
                      ),
                      Positioned(
                        left: 150,
                        top: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 40,
                            ),
                            Text(
                              "Rs. 50000",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Flexible flexible() {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Stack(
            children: [
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  child: Image.network(
                    "https://images.unsplash.com/photo-1644049335447-298f557ff21a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black26,
                ),
              ),
              Positioned(
                left: 50,
                top: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text(
                      "Rs. 50000",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _slider({required String img}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(img))),
    );
  }
}
