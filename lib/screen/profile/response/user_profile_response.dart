import 'package:quiz_app/screen/profile/data_source/user_profile_ds.dart';
import 'package:quiz_app/screen/profile/model/model.dart';

class UserProfileRepo {
  UserDataProfile userDataProfile = UserDataProfile();

  Future<UserModel?> fetchUserData() async {
    final user = await userDataProfile.fetchUserData();
    return user;
  }
}
