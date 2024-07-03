import 'package:bloc/bloc.dart';
import '../../../domain/repositories/product.dart';
import 'event.dart';
import 'state.dart';

/// product details bloc
class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  /// product details repository
  final ProductRepository repository;

  /// constructor

  ProductDetailsBloc({required this.repository})
      : super(ProductDetailsInitial()) {
    on<FetchProduct>(_onFetchProduct);
  }

  /// Fetches a product details from the repository and emits the corresponding state.
  ///
  /// Parameters:
  /// - `event`: The `FetchProduct` event containing the product ID to fetch.
  /// - `emit`: The `Emitter` used to emit the state.
  ///
  /// Returns: `void`.
  ///
  /// Throws:
  /// - `ProductDetailsError`: If an error occurs while fetching the product details.
  Future<void> _onFetchProduct(
      FetchProduct event, Emitter<ProductDetailsState> emit) async {
    emit(ProductDetailsLoading());
    try {
      final product = await repository.getDetails(event.id);
      emit(ProductDetailsLoaded(product: product));
    } catch (error) {
      emit(ProductDetailsError(message: error.toString()));
    }
  }
}
