import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? amount;
  String? email;
  String? name;
  String? photoUrl;
  String? rank;
  String? level;
  String? uid;

  UserModel({
    this.name,
    this.photoUrl,
    this.email,
    this.amount,
    this.level,
    this.rank,
    this.uid,
  });

  UserModel.fromJson(DocumentSnapshot<Object?> doc) {
    photoUrl = doc['photoUrl'];
    name = doc['name'];
    amount = doc['amount'];
    email = doc['email'];
    rank = doc['rank'];
    level = doc['level'];
    uid = doc["uid"];
  }
}
