import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/check_quiz_unlock/bloc.dart';
import 'package:quiz_app/config/app_config.dart';
import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/screen/profile/model/model.dart';
import 'package:quiz_app/screen/profile/profile_bloc/bloc.dart';
import 'package:quiz_app/screen/quizes/model/jee_quiz_model.dart';
import 'package:quiz_app/screen/quizes/quiz_bloc/jee_quizes_bloc.dart';
import 'package:quiz_app/screen/ui/quiz_intro_page.dart';
import 'package:quiz_app/utils/permission_handeler.dart';
import 'package:quiz_app/widget/side_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PermissionHandler permissionHandler = PermissionHandler();

  UserProfileBloc userProfileBloc = UserProfileBloc();
  QuizListingBloc quizListingBloc = QuizListingBloc();
  CheckQuizUnlockBloc checkQuizUnlockBloc = CheckQuizUnlockBloc();

  @override
  void initState() {
    super.initState();
    userProfileBloc.fetchUserData();
    quizListingBloc.fetchQuizListData();
    // checkQuizUnlockBloc.checkQuizUnlocked()
    permissionHandler.requestCameraPermission();
    permissionHandler.requestStorafePermission();
    // getQuizes();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeConfig.appBarColor,
      ),
      drawer: StreamBuilder<UserModel?>(
        stream: userProfileBloc.userModel,
        builder: (context, snapshot) => SideNavBar(
          money: snapshot.data?.amount ?? "",
          name: snapshot.data?.name ?? '',
          profileUrl: snapshot.data?.photoUrl ?? "",
          level: snapshot.data?.level ?? "",
          rank: snapshot.data?.rank ?? "",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize! * 1),
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
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 0.8)),
              Container(
                padding: EdgeInsets.only(
                    top: SizeConfig.defaultSize! * 1.3,
                    left: SizeConfig.defaultSize! * 1.5),
                width: SizeConfig.screenWidth,
                height: SizeConfig.defaultSize! * 4,
                child: Text(
                  "Popular Quizes",
                  style: AppThemeConfig.mainTitle,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 0.7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: SizeConfig.defaultSize! * 3.5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: SizeConfig.defaultSize! * 3.5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: SizeConfig.defaultSize! * 3.5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                      radius: SizeConfig.defaultSize! * 3.5,
                    ),
                  ],
                ),
              ),
              StreamBuilder<List<QuizListingModel>?>(
                  stream: quizListingBloc.quizListingModel,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: const CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text(
                        "Oops",
                        style: AppThemeConfig.title,
                      );
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.defaultSize! * 0.6),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        var data = snapshot.data?[index];
                        return flexible(data!);
                      },
                    );
                  }),
              Padding(
                padding: EdgeInsets.all(SizeConfig.defaultSize! * 0.9),
                child: SizedBox(
                  height: SizeConfig.screenHeight! * 0.26,
                  width: SizeConfig.screenWidth,
                  child: Card(
                    elevation: 8,
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: SizeConfig.screenWidth,
                      child: Image.network(
                        "https://images.unsplash.com/photo-1644049335447-298f557ff21a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize! * 1.1,
                    vertical: SizeConfig.defaultSize! * 1.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Top Player in this week",
                        style: AppThemeConfig.mainTitle),
                    Text("Last Update 5 days ago",
                        style: AppThemeConfig.subtitle2),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 1,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: AppThemeConfig.lightSecondaryColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        StreamBuilder<UserModel?>(
                          stream: userProfileBloc.userModel,
                          builder: (context, snapshot) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data?.name?.toString() ?? "",
                                  style: AppThemeConfig.title),
                              Text("Player ID: ABD348",
                                  style: AppThemeConfig.subtitle2),
                              Text("RS.${snapshot.data?.amount ?? ""}",
                                  style: AppThemeConfig.subtitle2),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: SizeConfig.defaultSize! * 1,
                        left: SizeConfig.defaultSize! * 1.5),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.defaultSize! * 4,
                    child: Text(
                      "Unlock New Quizes",
                      style: AppThemeConfig.mainTitle,
                    ),
                  ),
                  StreamBuilder<List<QuizListingModel>?>(
                    stream: quizListingBloc.quizListingModel,
                    builder: (context, snapshot) => GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.defaultSize! * 0.78769),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        var data = snapshot.data?[index];
                        return unlockQuizes(data!);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: SizeConfig.screenHeight! * 0.26,
                  width: SizeConfig.screenWidth,
                  child: Card(
                    elevation: 8,
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1644049335447-298f557ff21a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              CarouselSlider(
                  items: [
                    _slider(
                        img:
                            "https://images.unsplash.com/photo-1644049335447-298f557ff21a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"),
                  ],
                  options: CarouselOptions(
                      height: SizeConfig.screenHeight! * 0.22,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 0.8)),
              const SizedBox(
                height: 15,
              ),
              Text(
                "V.1.0.10  Made By Dilshad Alam",
                style: AppThemeConfig.subtitle3,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget flexible(QuizListingModel quizListingModel) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
        elevation: 8,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(20)),
        child: CachedNetworkImage(
          errorWidget: (context, url, error) =>
              const Icon(Icons.error_outline_sharp),
          imageUrl: quizListingModel.quiz_thumbnail ?? "",
          // "https://images.unsplash.com/photo-1644049335447-298f557ff21a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget unlockQuizes(QuizListingModel quizListingModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  QuizIntroPage(quizListingModel: quizListingModel),
            ));
      },
      child: Card(
        elevation: 8,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(20)),
        child: CachedNetworkImage(
          errorWidget: (context, url, error) =>
              const Icon(Icons.error_outline_sharp),
          imageUrl: quizListingModel.quiz_thumbnail ?? "",
          // "https://images.unsplash.com/photo-1644049335447-298f557ff21a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
          fit: BoxFit.cover,
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
