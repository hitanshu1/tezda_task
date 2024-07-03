import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/shareService.dart';
import '../../../domain/repositories/product.dart';
import '../../bloc/productDetails/bloc.dart';
import '../../bloc/productDetails/event.dart';
import '../../bloc/productDetails/state.dart';
import '../../bloc/wishList/bloc.dart';
import '../../bloc/wishList/event.dart';
import 'widgets/details.dart';

/// product details page
class ProductDetailsPage extends StatefulWidget {
  /// product id
  final int id;

  /// constructor
  const ProductDetailsPage({super.key, required this.id});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isInWishlist = false;
  @override
  void initState() {
    isInWishlist = context.read<WishlistBloc>().isInWishlist(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailsBloc(repository: ProductRepository.instance)
            ..add(FetchProduct(widget.id)),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Product Details'),
            actions: [
              if (state is ProductDetailsLoaded)
                IconButton(
                  icon: Icon(
                    isInWishlist ? Icons.favorite : Icons.favorite_border,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    if (isInWishlist) {
                        context
                            .read<WishlistBloc>()
                            .add(RemoveFromWishlist(state.product));
                      } else {
                        context
                            .read<WishlistBloc>()
                            .add(AddToWishlist(state.product));
                      }
                      isInWishlist = !isInWishlist;
                      setState(() {
                        
                      });
                    // Handle favorite action
                  },
                ),
              if (state is ProductDetailsLoaded)
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    ShareService.shareText(state.product.title ?? '');
                    // Handle share action
                  },
                ),
            ],
          ),
          body: _body(state),
        );
      }),
    );
  }

  // Returns the appropriate widget based on the state provided. Displays a loading indicator if the state is ProductDetailsLoading,
  Widget _body(ProductDetailsState state) {
    if (state is ProductDetailsLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is ProductDetailsLoaded) {
      return ProductDetails(product: state.product);
    } else if (state is ProductDetailsError) {
      return Center(child: Text(state.message));
    }
    return const Center(child: Text('Select a product'));
  }
}
