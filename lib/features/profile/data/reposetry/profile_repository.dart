import 'package:chef_app/features/profile/data/models/profile_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/commens.dart';

class ProfileRepository{
  Future<Either<String, ProfileModel>> updateProfile({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.updateChef,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
        },
      );
      return Right(ProfileModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }



  Future<Either<String,String>> editProfile(
      {
        required XFile profileImage,
        required String name,
        required int phoneNumber,
        required String brandName,
        required int minimumCharge,
        required String description,
        required String location
      }
      ) async{
    try{
      final response = await sl<ApiConsumer>().post(EndPoint.updateChef,
          isFormData: true,
          data: {
            //!! image
            ApiKeys.profilePic: await uploadImageToApi(profileImage),
            //!! name
            ApiKeys.name: name,
            //!!phone
            ApiKeys.phone: phoneNumber,
            //!! brand name
            ApiKeys.brandName: brandName,
            //!! mim charge
            ApiKeys.minimumCharge: minimumCharge,
            //!! description
            ApiKeys.description: description,
            //!!location
            ApiKeys.location: location
          });
      return Right(response[ApiKeys.message]);
    }on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }





  Future<Either<String, String>> changeOldPassword({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      final response = await sl<ApiConsumer>().patch(
        EndPoint.chefChangePassword,
        data: {
          ApiKeys.oldPass: oldPassword,
          ApiKeys.newPass: newPassword,
          ApiKeys.confirmPassword: confirmNewPassword,
        },
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }





}