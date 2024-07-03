import 'package:equatable/equatable.dart';

/// product event
abstract class ProductEvent extends Equatable {
  /// constructor
  const ProductEvent();
  @override
  List<Object?> get props => [];
}

///get home products
class GetProducts extends ProductEvent {}
