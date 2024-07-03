
import 'package:flutter/material.dart';
import '../../../../Extensions/Extensions.dart';
import '../../../../Widgets/Widgets.dart';
import '../../../../Widgets/ratingBar.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/Widgets/richString.dart';
import '../../../../data/models/product.dart';
import 'colorOption.dart';
import 'images.dart';
import 'sizeOption.dart';
/// product details widget
class ProductDetails extends StatefulWidget {
  /// product
  final ProductModel product;
/// constructor
  const ProductDetails({super.key, required this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  

  int quantity = 1;
  
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImages(images: widget.product.images ?? []),
          SizeConfig.verticalSpace(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Txt(widget.product.title, 
                fontSize: 24, fontWeight: FontWeight.bold),
              _infoTitle(
                title: 'Price',
                subtitle: '${widget.product.price?.toCurrency}',
              ),
                
              
                const RatingBarr(rating: 4,),
               _infoTitle(
                title: 'Stock',
                subtitle: 'In Stock',
               ),
               _infoTitle(
                title: 'Brand',
                subtitle:'Abc',
               ),
               _infoTitle(
                title: 'Description',
                subtitle:widget.product.description,
               ),
                _infoTitle(
                  title: 'Category',
                  subtitle: widget.product.category?.name
                ),
            
               
                 DetailsColorOption(
                  onColorSelected: (color){

                  },
                ),
                
                DetailsSizeOption(
                  onSizeChange: (val){

                  },
                ),
              
                _buildQuantitySelector(),
                
              ].map((e)=>Column(children: [e, SizeConfig.verticalSpace()])).toList(),
            ),
          ),
        ],
      ),
    );
  }

 
 Widget _infoTitle({String? title, String? subtitle}) {
    return RichTxt(richStrings: [
      RichString('${title??''}: ', color: Colorz.blue, fontWeight: FontWeight.bold),
      RichString(subtitle ?? '', color: Colors.black,),
    ]);
  }

 

  
  Widget _buildQuantitySelector() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: quantity > 1 ? () {
            setState(() {
              quantity--;
            });
          } : null,
        ),
        Text(quantity.toString(), style: const TextStyle(fontSize: 20)),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              quantity++;
            });
          },
        ),
      ],
    );
  }
}
