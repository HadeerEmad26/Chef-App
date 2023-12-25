import 'package:chef_app/core/database/api/end_points.dart';

class ProfileModel {
  final String message;
  final String token;

  ProfileModel({
    required this.message,
    required this.token,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileModel(
      message: jsonData[ApiKeys.message],
      token: jsonData[ApiKeys.token],
    );
  }
}