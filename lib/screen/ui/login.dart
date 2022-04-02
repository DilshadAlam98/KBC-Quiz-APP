import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quiz_app/config/app_config.dart';
import 'package:quiz_app/config/size_config.dart';

import 'package:quiz_app/service/auth.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Internet().chekInterntConnection();
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      connected
          ? showSimpleNotification(
          Text("Connected to internet"))
          : showSimpleNotification(Text("No internet Connection"));
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(SizeConfig.defaultSize!*2),
            constraints: BoxConstraints(maxHeight:screenSize.height ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("asset/img/kbc.png"),
                 SizedBox(
                  height: SizeConfig.defaultSize!*2,
                ),
                 Text(
                  "Welcome \n To KBC Quiz App",
                  textAlign: TextAlign.center,
                    style: AppThemeConfig.mainTitle,
                ),
                 SizedBox(
                  height: SizeConfig.defaultSize!*3,
                ),

                // Container(
                //   height: SizeConfig.defaultSize!*3.5,
                //   width: SizeConfig.defaultSize!*22,
                //   color: AppThemeConfig.buttonColor,
                //   child: Row(
                //     mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Icon(Icons.login),
                //     Text("Sign In with Google",style: AppThemeConfig.title,)
                //     // ElevatedButton(onPressed: () {
                //     //
                //     // }, child: Text("Login"))
                //   ],
                //   ),
                // ),
                SignInButton(

                    Buttons.Google,
                    onPressed: () async {
                        signinWithGoogle(context);
                        showLoaderDialog(context);
                      })
              ],
            ),
          ),
        ),
      ),
    );
  }
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content:  Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: true,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}
