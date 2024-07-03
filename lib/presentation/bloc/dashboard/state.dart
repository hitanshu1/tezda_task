import 'package:equatable/equatable.dart';

/// dash board state
class DashBoardState extends Equatable {
  /// dash board page index
  final int pageIndex;
  /// constructor
  const DashBoardState({ this.pageIndex=0});
  @override
 
  List<Object?> get props => [pageIndex];

/// Creates a new instance of [DashBoardState] with an optional [pageIndex] parameter.
///
/// If [pageIndex] is not provided, the new instance will have the same [pageIndex]
/// as the current instance.
///
/// Returns a new instance of [DashBoardState].
  DashBoardState copyWith({int? pageIndex}) {
    return DashBoardState(pageIndex: pageIndex ?? this.pageIndex);
  }
}
