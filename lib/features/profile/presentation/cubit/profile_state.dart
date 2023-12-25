abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class EditImageProfileState extends ProfileState {}

class EditProfileSuccessState extends ProfileState {}

class EditProfileLoadingState extends ProfileState {}
class EditProfileErrorState extends ProfileState {}
class EditNameSuccesfullyState extends ProfileState {}
