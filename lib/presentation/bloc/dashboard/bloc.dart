
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

/// dash board bloc
 class DashBoardBloc extends Bloc<DashboardEvent, DashBoardState> {
  /// constructor
  DashBoardBloc() : super(const DashBoardState()) {
    on<ChangeTabDashBoardEvent>(_onChangePage);
  }

  /// Changes the page index in the dashboard state.
  ///
  /// This function is called when a [ChangeTabDashBoardEvent] is emitted. It updates
  /// the [DashBoardState] with the new [pageIndex] from the event.
  ///
  /// Parameters:
  /// - [event]: The [ChangeTabDashBoardEvent] that triggered the function.
  /// - [emit]: The [Emitter] used to emit the updated [DashBoardState].
  ///
  /// Returns: void
  void _onChangePage(ChangeTabDashBoardEvent event, Emitter<DashBoardState> emit) { 
    if(event.pageIndex>=0){
      emit(state.copyWith(pageIndex: event.pageIndex));
    }
    

  }
}
