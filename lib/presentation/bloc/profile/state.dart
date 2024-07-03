import 'package:equatable/equatable.dart';

import '../../../data/models/user.dart';
/// Profile state
/// Abstract Profile state
abstract class ProfileState extends Equatable {
  /// User profile
  final UserModel userProfile;

  /// Constructor
  const ProfileState({required this.userProfile});

  @override
  List<Object> get props => [userProfile];
}

/// Profile initial state
class ProfileInitial extends ProfileState {
  /// Constructor
   ProfileInitial({UserModel? userProfile})
      : super(userProfile: userProfile ?? UserModel.checkingUser());
}

/// Profile loading state
class ProfileLoading extends ProfileState {
  /// Constructor
  const ProfileLoading({required super.userProfile});
}

/// Profile loaded state
class ProfileLoaded extends ProfileState {
  /// Constructor
  const ProfileLoaded({required super.userProfile});
}

/// Profile updated state
class ProfileUpdated extends ProfileState {
  /// Constructor
  const ProfileUpdated({required super.userProfile});
}

/// Profile error state
class ProfileError extends ProfileState {
  /// Error message
  final String message;

  /// Constructor
  const ProfileError({required this.message, required super.userProfile});

  @override
  List<Object> get props => [userProfile, message];
}
