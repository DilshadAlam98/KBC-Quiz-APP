import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class Internet{
  bool connected=false;

  chekInterntConnection()async{
    connected=await InternetConnectionChecker().hasConnection;
    final msg=connected?"Connected to Internet":"No Internet Connection";
    showSimpleNotification(Text(msg));

  }
}