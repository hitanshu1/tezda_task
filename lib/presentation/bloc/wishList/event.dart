import 'package:equatable/equatable.dart';

import '../../../data/models/product.dart';

/// wishlist event
abstract class WishlistEvent extends Equatable {
  /// constructor
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

/// add to wishlist
class AddToWishlist extends WishlistEvent {
  /// product
  final ProductModel product;

  /// constructor
  const AddToWishlist(this.product);

  @override
  List<Object> get props => [product];
}

/// remove from wishlist
class RemoveFromWishlist extends WishlistEvent {
  /// product
  final ProductModel product;

  /// constructor
  const RemoveFromWishlist(this.product);

  @override
  List<Object> get props => [product];
}

/// load wishlist
class GetWishlist extends WishlistEvent {}
