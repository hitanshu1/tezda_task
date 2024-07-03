import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Widgets/Views/Views.dart';
import '../../../../core/constants/constants.dart';
import '../../../bloc/wishList/bloc.dart';
import '../../../bloc/wishList/state.dart';
import '../../common/cards/product.dart';

/// favourite tab
class FavouriteTab extends StatelessWidget {
  /// constructor
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.all(SizeConfig.spaceBetween),
        child: GriddViewBuilder(item: (int index) {
          if (state is WishlistLoaded) {
            return ProductCard(
              type: ProductCardType.wishList,
              product: state.wishlist[index],
              onTap: () {},
            );
          }
          return null; 
        },isLoading: state is WishlistLoading,
        itemCount: state is WishlistLoaded ? state.wishlist.length : 0,),
      );
    });
  }
}
