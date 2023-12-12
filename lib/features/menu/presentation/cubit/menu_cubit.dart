import 'package:chef_app/features/menu/data/reposetry/menu_repositry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/meal_model.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepository) : super(MenuInitial());
  final MenuRepository menuRepository;
  XFile? image;
  GlobalKey<FormState> addToMenuKey = GlobalKey<FormState>();
  TextEditingController mealNameController = TextEditingController();
  TextEditingController mealPriceController = TextEditingController();
  TextEditingController mealDescriptionController = TextEditingController();
  List<String> categoryList = [
    'Beef',
    'Chicken',
    'Fish',
    'Seafood',
    'Pork',
    'Lamb',
    'Vegetarian',
    'Vegan',
    'Gluten-free',
    'Dairy-free',
    'Breakfast',
    'Lunch',
    'Dinner',
    'Appetizers',
    'Salads',
    'Soups',
    'Sandwiches',
    'Pasta',
    'Pizza',
    'Rice dishes',
    'Stir-fries',
    'Curries',
    'Desserts',
    'Baked goods',
    'Snacks',
  ];
  String selectedItem = "Beef";

  void changeItem(item) {
    selectedItem = item;
    emit(ChangeItemState());
  }

  String groupValue = "quantity";

  void changeGroupValue(value) {
    groupValue = value;
    emit(ChangeGroupValueState());
  }

  void addDishToMenu() async {
    emit(AddDishToMenuLoadingState());
    final result = await menuRepository.addDishMenu(
      image: image!,
      mealName: mealNameController.text,
      mealDescription: mealDescriptionController.text,
      mealCategory: selectedItem,
      howToSell: groupValue,
      mealPrice: double.parse(mealPriceController.text),
    );
    result.fold((l) => emit(AddDishToMenuErrorState()),
        (r) => emit(AddDishToMenuSuccessState()));
  }


  void deleteDish(id) async {
    emit(DeleteDishLoadingState());
    final result = await menuRepository.deleteMeal(id: id);
    result.fold((l) => emit(DeleteDishErrorState()),
        (r) => emit(DeleteDishSuccessState()));
  }

  List<MealModel> meals = [];

  void getAllMeals() async {
    emit(GetAllChefMealLoadingState());
    final result = await menuRepository.getMeals();
    result.fold((l) =>     emit(GetAllChefMealErrorState())
        , (r) {
      meals=r.meals;
          emit(GetAllChefMealSuccessState());
        }
    );
  }


  //!!take image from user
 void takeImage(value){
    image=value;
    emit(TakeImageFromUserState());
 }


}
