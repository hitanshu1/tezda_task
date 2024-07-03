import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Extensions/Extensions.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/getStorage.dart';
import '../../../data/models/Model.dart';

part 'state.dart';
part 'event.dart';

/// AppUser bloc manange state and event
class AppUserBloc extends Bloc<AppUserEvent, AppUser> {
  /// bloc constructor
  AppUserBloc() : super(AppUser.checking) {
    on<GetAppUser>(_fetchFn);
    
  }

    /// Fetches the user data asynchronously.
    ///
    /// This function is called when a `GetAppUser` event is emitted. It emits a `AppUser.checking` state
    /// initially, and then retrieves the user data from `AppGetXStorage.getUser`. Finally, it emits the
    /// retrieved user data.
    ///
    /// Parameters:
    /// - `event`: The `GetAppUser` event that triggered the function.
    /// - `emit`: The `Emitter` used to emit states.
    ///
    /// Returns: A `Future` that completes when the user data is fetched and emitted.
  Future<void> _fetchFn(GetAppUser event, Emitter<AppUser> emit) async {
    emit(AppUser.checking);
    final AppUser appUser = AppGetXStorage.instance.getUser;
    emit(appUser);
  }


}
