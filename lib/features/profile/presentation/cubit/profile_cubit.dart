import 'package:chef_app/features/profile/data/reposetry/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  XFile? profileImage;
  final ProfileRepository profileRepo;
  GlobalKey<FormState> editProfileKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController minimumChargeController = TextEditingController();

  void updateProfile() async {
    emit(EditProfileLoadingState());
    final result = await profileRepo.editProfile(
      profileImage: profileImage!,
      name: nameController.text,
      phoneNumber: int.parse(phoneController.text),
      brandName: brandNameController.text,
      minimumCharge: int.parse(minimumChargeController.text),
      description: descriptionController.text,
      location: locationController.text,
    );
    result.fold((l) => emit(EditProfileErrorState()),
        (r) => emit(EditProfileSuccessState()));
  }


  //!!take image from user
  void takeImage(value) {
    profileImage = value;
    emit(EditImageProfileState());
  }


}
