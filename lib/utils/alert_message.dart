import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quiz_app/config/app_config.dart';

class DialogueUtils {
  static void showInSnackBar(
      {String? value, BuildContext? context, Color? backgroundColor}) {
    Scaffold.of(context!).showSnackBar(SnackBar(
      content: Text(value!),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
      backgroundColor: backgroundColor,
      elevation: 8,
    ));
  }

  static void showToast({
    String? value,
    double? fontSize,
    Color? color,
    Color? backgroundColor,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
        msg: value!,
        fontSize: fontSize,
        textColor: color,
        backgroundColor: backgroundColor,
        gravity: gravity);
  }

  static void awesomeAlert(
      {BuildContext? context,
      VoidCallback? ButtonClick,
      String? tittle,
      String? Desc,
      bool? showCloseIcon,
      VoidCallback? btnCancelOnPress,
      DialogType? dialogType}) {
    AwesomeDialog(
      context: context!,
      dialogType: dialogType!,
      borderSide: BorderSide(
        color: AppThemeConfig.buttonColor,
        width: 2,
      ),
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: tittle,
      desc: Desc,
      showCloseIcon: showCloseIcon!,
      btnCancelOnPress: ButtonClick,
      btnOkOnPress: btnCancelOnPress,
    ).show();
  }
}
