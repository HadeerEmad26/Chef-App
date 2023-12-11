import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/utils/commens.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/database/cache_helper/cache_helper.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/service_locator.dart';
import '../models/meal_model.dart';

class MenuRepository{
  Future<Either<String,String>> addDishMenu(
  {
    required XFile image,
    required String mealName,
    required String mealDescription,
    required String mealCategory,
    required String howToSell,
    required double mealPrice
}
      ) async{
    try{
      final response = await sl<ApiConsumer>().post(EndPoint.addMeal, data: {
        //!!meal image
        ApiKeys.mealImages: await uploadImageToApi(image),
        //!!meal name
        ApiKeys.name: mealName,
        //!!meal price
        ApiKeys.price: mealPrice,
        //!! meal description
        ApiKeys.description: mealDescription,
        //!! category
        ApiKeys.category: mealCategory,
        //!!how to sell
        ApiKeys.howToSell: howToSell
      });
      return Right(response[ApiKeys.message]);
    }on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }



  Future<Either<String, String>> deleteMeal({
    required String id,
  }) async {
    try {
      final response = await sl<ApiConsumer>().delete(
        EndPoint.getDeleteMealEndPoint(id),
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, GetAllMealsModel>> getMeals() async {
    try {
      final response = await sl<ApiConsumer>().get(
          EndPoint.getAllChefMeals(sl<CacheHelper>().getData(key: ApiKeys.id)));
      return Right(GetAllMealsModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}


