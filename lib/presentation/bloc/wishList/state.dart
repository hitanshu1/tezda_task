import 'package:equatable/equatable.dart';

import '../../../data/models/product.dart';


/// wishlist state
abstract class WishlistState extends Equatable {
  /// constructor
  const WishlistState();

  @override
  List<Object> get props => [];
}
/// wishlist initial state

class WishlistInitial extends WishlistState {}

/// wishlist loading state
class WishlistLoading extends WishlistState {}

/// wishlist loaded state
class WishlistLoaded extends WishlistState {
  /// wishlist products
  final List<ProductModel> wishlist;
/// constructor
  const WishlistLoaded(this.wishlist);

  @override
  List<Object> get props => [wishlist];
}

/// wishlist error state
class WishlistError extends WishlistState {
  /// error message
  final String message;
/// constructor
  const WishlistError(this.message);

  @override
  List<Object> get props => [message];
}
