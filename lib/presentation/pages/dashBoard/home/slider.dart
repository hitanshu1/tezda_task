import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Widgets/Views/horizontalSlider.dart';
import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';

/// home slider
class HomeSlider extends StatelessWidget {
  /// constructor
   HomeSlider({super.key});

/// list of images
 final List<String> images = [
'https://t4.ftcdn.net/jpg/02/61/01/87/360_F_261018762_f15Hmze7A0oL58Uwe7SrDKNS4fZIjLiF.jpg',
'https://i.pinimg.com/originals/20/7d/fa/207dfae2b452e49dad9b9696b57a91a1.png',
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return HorizontalSlider(
        item: (int index) {
          return _card(width: width,imageUrl: images[index]);
        },
        itemCount: images.length);
  }

  Widget _card({
    double width = 0,
    String ?imageUrl
  }) {
    return Stack(
      children: [
        ViewAppImage(
          radius: 10.sp,
          imageUrl:
              imageUrl,
        ),
        Positioned.fill(
          child: ClipRect(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(0.7), // Fully blurred
                    Colors.black.withOpacity(0.5), // Partially blurred
                    Colors.black.withOpacity(0.1), // No blur
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.spaceBetween * 2),
                    child: SizedBox(
                      width: width * .4,
                      child: Txt(
                        'Best offer',
                        color: Colorz.white,
                        fontSize: SizeConfig.largeFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
