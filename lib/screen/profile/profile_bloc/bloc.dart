import 'package:quiz_app/screen/profile/model/model.dart';
import 'package:quiz_app/screen/profile/response/user_profile_response.dart';
import 'package:rxdart/rxdart.dart';

class UserProfileBloc {
  final BehaviorSubject<UserModel?> _userModel =
      BehaviorSubject<UserModel?>();

  Stream<UserModel?> get userModel => _userModel;
  UserProfileRepo userProfileRepo = UserProfileRepo();

  Future<void> fetchUserData() async {
    _userModel.add(await userProfileRepo.fetchUserData());
  }
}





