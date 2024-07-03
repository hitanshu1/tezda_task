import 'package:bloc/bloc.dart';

import '../../../Widgets/Widgets.dart';
import '../../../core/utils/getStorage.dart';
import '../../../data/models/product.dart';
import 'event.dart';
import 'state.dart';

/// wishlist bloc
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  ///
  final AppGetXStorage appGetXStorage;

  /// constructor
  WishlistBloc({required this.appGetXStorage}) : super(WishlistInitial()) {
    on<AddToWishlist>(_onAddToWishlist);
    on<RemoveFromWishlist>(_onRemoveFromWishlist);
    on<GetWishlist>(_onLoadWishlist);
  }

  void _onAddToWishlist(AddToWishlist event, Emitter<WishlistState> emit) {
    try {
      appGetXStorage.addToWishlist(event.product);
      final List<ProductModel> wishlist = appGetXStorage.getWishlist();
      emit(WishlistLoaded(wishlist));
      Widgets.showToast('Added to wishlist');
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }

  void _onRemoveFromWishlist(
      RemoveFromWishlist event, Emitter<WishlistState> emit) {
    try {
      appGetXStorage.removeFromWishlist(event.product);
      final List<ProductModel> wishlist = appGetXStorage.getWishlist();
      emit(WishlistLoaded(wishlist));
      Widgets.showToast('Removed from wishlist');
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }

  void _onLoadWishlist(GetWishlist event, Emitter<WishlistState> emit) {
    try {
      final List<ProductModel> wishlist = appGetXStorage.getWishlist();
      emit(WishlistLoaded(wishlist));
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }

  /// Checks if the given product is in the wishlist by comparing its id with other items in the wishlist.
  bool isInWishlist(int id) {
    final List<ProductModel> wishlist = appGetXStorage.getWishlist();
    return wishlist.any((item) => item.id == id);
  }
}
