// profile_bloc.dart

import 'package:bloc/bloc.dart';

import '../../../data/models/user.dart';
import '../../../domain/repositories/userRepository.dart';
import 'event.dart';
import 'state.dart';


/// profile bloc
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  /// profile repository
  final UserRepository repository;
/// constructor
  ProfileBloc({required this.repository}) : super(ProfileInitial(
   userProfile: UserModel.checkingUser()
  )) {
    on<FetchProfile>(_onFetchProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onFetchProfile(FetchProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading(userProfile: state.userProfile));

    try {
      final userProfile = await repository.getDetails();
      emit(ProfileLoaded(userProfile: userProfile));
    } catch (error) {
      emit(ProfileError(message: error.toString(), userProfile: state.userProfile));
    }
  }

  Future<void> _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading(userProfile: event.profileData));

    try {
      final response = await repository.updateDetails(event.profileData);
      if (response.isSuccess) {
        emit(ProfileUpdated(userProfile: event.profileData));
      } else {
        emit( ProfileError(message: 'Failed to update profile', userProfile:event.profileData));
      }
    } catch (error) {
      emit(ProfileError(message: error.toString(), userProfile: event.profileData));
    }
  }
}
