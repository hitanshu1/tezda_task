import 'package:equatable/equatable.dart';

/// product details event
abstract class ProductDetailsEvent extends Equatable {
  /// constructor
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

/// get product details
class FetchProduct extends ProductDetailsEvent {
  /// product id
  final int id;
/// constructor
  const FetchProduct(this.id);

  @override
  List<Object> get props => [id];
}
