import 'package:soundx/features/auth/data/models/user_model.dart';
import 'package:soundx/features/auth/domain/entities/user_entity.dart';

extension UserEntityMapper on UserModel {
  UserEntity toUserEntity() {
    return UserEntity(
      uid: uid,
      displayName: displayName,
      phoneNumber: phoneNumber,
      email: email,
    );
  }
}
