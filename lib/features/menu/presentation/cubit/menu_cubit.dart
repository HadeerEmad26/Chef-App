import 'package:chef_app/features/menu/data/reposetry/menu_repositry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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

  void changeItem(item){
    selectedItem=item;
    emit(ChangeItemState());
  }
  String groupValue = "quantity";

  void changeGroupValue(value){
    groupValue=value;
    emit(ChangeGroupValueState());
  }
}
