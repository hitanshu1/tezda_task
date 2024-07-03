import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/product.dart';
import '../../../bloc/wishList/bloc.dart';
import '../../../bloc/wishList/event.dart';

/// product card type use to define type for wish icon and delete icon
enum ProductCardType {
  /// main card
  main,

  /// wish list
  wishList,

  /// none
  none
}

/// common product card
class ProductCard extends StatefulWidget {
  /// product
  final ProductModel product;

  /// on tap
  final VoidCallback? onTap;

  /// type
  final ProductCardType type;

  /// constructor
  const ProductCard(
      {super.key,
      required this.product,
      this.onTap,
      this.type = ProductCardType.main});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isInWishlist = false;
  @override
  void initState() {
    if (widget.product.id != null) {
      isInWishlist =
          context.read<WishlistBloc>().isInWishlist(widget.product.id!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Cardd(
        child: Stack(
          children: [
            ViewAppImage(
              radius: SizeConfig.borderRadius,
              imageUrl: widget.product.images?.first,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    padding: EdgeInsets.all(10.sp),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colorz.black.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Txt(
                          widget.product.title.toString(),
                          color: Colorz.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizeConfig.verticalSpaceSmall(),
                        Txt(
                          widget.product.price,
                          toCurrency: true,
                          color: Colorz.white,
                          fontSize: 15.sp,
                        ),
                      ],
                    )),
              ),
            ),
            if (widget.type == ProductCardType.main) _wishIcon(),
            if (widget.type == ProductCardType.wishList) _deleteIcon(),
          ],
        ),
      ),
    );
  }

  // Returns a `Widget` that represents a wish icon positioned at the top right corner of its parent.
  //
  // The wish icon is a `Positioned.fill` widget that covers the entire parent widget. 
  // The icon itself is an `IconButton` with either the `favorite` icon or the `favorite_border` icon from the `Icons` class based on the `isInWishlist` condition.
  //
  // When the wish icon is pressed, it triggers either the `RemoveFromWishlist` event or the `AddToWishlist` event in the `WishlistBloc` using the `context.read` method,
  // depending on the `isInWishlist` condition. The `widget.product` is passed as an argument to the event.
  // The `isInWishlist` state is toggled, triggering a rebuild of the widget. 
  //
  // Returns a `Widget` that represents the wish icon.
  Widget _wishIcon() {
    return Positioned.fill(
        child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                isInWishlist ? Icons.favorite : Icons.favorite_border,
                color: Colors.amber,
              ),
              onPressed: () {
                if (isInWishlist) {
                  context
                      .read<WishlistBloc>()
                      .add(RemoveFromWishlist(widget.product));
                } else {
                  context
                      .read<WishlistBloc>()
                      .add(AddToWishlist(widget.product));
                }
                isInWishlist = !isInWishlist;
                setState(() {});
                // Handle favorite action
              },
            )));
  }

    /// Returns a `Widget` that represents a delete icon positioned at the top right corner of its parent.
    ///
    /// The delete icon is a `Positioned.fill` widget that covers the entire parent widget. The icon itself is an `IconButton` with the `delete` icon from the `Icons` class. The color of the icon is set to `Colorz.red`.
    ///
    /// When the delete icon is pressed, it triggers the `RemoveFromWishlist` event in the `WishlistBloc` using the `context.read` method. The `widget.product` is passed as an argument to the event.
    ///
    /// Returns a `Widget` that represents the delete icon.
  Widget _deleteIcon() {
    return Positioned.fill(
      child: Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.delete, color: Colorz.red),
            onPressed: () {
              context
                  .read<WishlistBloc>()
                  .add(RemoveFromWishlist(widget.product));
            },
          )),
    );
  }
}
