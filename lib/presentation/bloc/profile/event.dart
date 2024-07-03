import 'package:equatable/equatable.dart';

import '../../../data/models/user.dart';

/// profile event
abstract class ProfileEvent extends Equatable {
  /// constructor
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

/// fetch profile
class FetchProfile extends ProfileEvent {}

/// update profile
class UpdateProfile extends ProfileEvent {
  /// profile data
  final UserModel profileData;
/// constructor
  const UpdateProfile(this.profileData);

  @override
  List<Object> get props => [profileData];
}
