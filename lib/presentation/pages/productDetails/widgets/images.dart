import 'package:flutter/material.dart';

import '../../../../Widgets/Widgets.dart';

/// product images
class ProductImages extends StatefulWidget {
  /// product images
 final List<String> images;

  /// constructor
  const ProductImages({super.key,required this.images});

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  String selectedImage = '';

  @override
  void initState() {
    super.initState();
    if (widget.images.isNotEmpty) {
      selectedImage = widget.images[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child:ViewAppImage(
              imageUrl: selectedImage,
              key: ValueKey<String>(selectedImage),
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(child: Align(
            alignment: Alignment.bottomCenter,
            child: _buildImageThumbnails(),
          ))
      ],
    );
  }

    /// Builds a row of image thumbnails based on the given list of [widget.images].
    ///
    /// Each image thumbnail is a [GestureDetector] that, when tapped, updates the
    /// [selectedImage] state with the tapped image. The thumbnails are displayed
    /// horizontally in the center of the row. Each thumbnail is a [Container] with
    /// a margin and padding. The border color of the container changes based on
    /// whether the thumbnail is selected or not. The thumbnail image is displayed
    /// using the [ViewAppImage] widget.
    ///
    /// Returns a [Widget] representing the row of image thumbnails.
  Widget _buildImageThumbnails() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.images.map((image) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedImage = image;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedImage == image ? Colors.blue : Colors.transparent,
                  width: 2,
                ),
              ),
              child: ViewAppImage(
                imageUrl: image,
                height: 50.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
