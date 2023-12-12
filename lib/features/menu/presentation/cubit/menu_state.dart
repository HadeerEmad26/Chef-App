abstract class MenuState {}

class MenuInitial extends MenuState {}

class ChangeItemState extends MenuState {}

class AddDishToMenuLoadingState extends MenuState {}

class AddDishToMenuSuccessState extends MenuState {}

class AddDishToMenuErrorState extends MenuState {}


class DeleteDishLoadingState extends MenuState {}

class DeleteDishSuccessState extends MenuState {}

class DeleteDishErrorState extends MenuState {}



class GetAllChefMealLoadingState extends MenuState {}

class GetAllChefMealSuccessState extends MenuState {}

class GetAllChefMealErrorState extends MenuState {}

class TakeImageFromUserState extends MenuState {}



class ChangeGroupValueState extends MenuState {}
