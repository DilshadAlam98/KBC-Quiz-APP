import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  Future<void> requestCameraPermission() async {
    final serviceStatus = await Permission.camera.isGranted;

    bool isCameraOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.camera.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      await openAppSettings();
    }
  }

  Future<void> requestStorafePermission() async {
    final serviceStatus = await Permission.storage.isGranted;
    bool isStorageOn = serviceStatus == ServiceStatus.enabled;
    final status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      print("Stoage permission Granted");
    } else if (status == PermissionStatus.denied) {
      print("Storage permission denie");
      await openAppSettings();
    } else {
      print("ERROR");
    }
  }

}
