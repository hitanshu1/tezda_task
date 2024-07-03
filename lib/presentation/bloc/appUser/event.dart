part of './bloc.dart';

/// Events for [AppUserBloc]
abstract class AppUserEvent extends Equatable {
  /// Constructor
  const AppUserEvent();
}

/// Get AppUser event
class GetAppUser extends AppUserEvent {
  @override
  List<Object> get props => <Object>[];
  @override
  String toString() {
    return 'Get AppUser';
  }
}
