import 'dart:convert';

import '../../constants.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/domin/entites/user_entity.dart';
import '../Service/shared_prefrences_singleton.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
