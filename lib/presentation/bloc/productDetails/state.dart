import 'package:equatable/equatable.dart';

import '../../../data/models/product.dart';
/// product details state
abstract class ProductDetailsState extends Equatable {
  /// constructor
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}
/// product details initial state

class ProductDetailsInitial extends ProductDetailsState {}
/// product details loading
class ProductDetailsLoading extends ProductDetailsState {}

/// product details success
class ProductDetailsLoaded extends ProductDetailsState {
  /// product details
  final ProductModel product;
/// constructor
  const ProductDetailsLoaded({required this.product});

  @override
  List<Object> get props => [product];
}

/// product details error

class ProductDetailsError extends ProductDetailsState {
  /// error message
  final String message;
/// constructor
  const ProductDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
