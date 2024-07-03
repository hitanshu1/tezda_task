import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widgets/Widgets.dart';
import '../../../core/constants/constants.dart';
import '../../bloc/dashboard/bloc.dart';
import '../../bloc/dashboard/event.dart';
import '../../bloc/dashboard/state.dart';

/// dash board bottom navigation bar
class DashBoardNavigationBar extends StatelessWidget {
  /// constructor
  const DashBoardNavigationBar({super.key});

  /// Returns a widget that displays a bottom navigation bar icon.
  ///
  /// The widget consists of an [Expanded] widget that contains an [Inkk] widget.
  /// The [Inkk] widget has an [onTap] callback that is called when the widget is tapped.
  /// The [onTap] callback is only called if the [onTap] parameter is not null.
  ///
  /// The [Inkk] widget's child is a [Column] widget that centers its children vertically.
  /// The [Column] widget contains three children:
  /// - A [SizeConfig.verticalSpaceSmall] widget.
  /// - A [Center] widget that contains a [ViewAppImage] widget.
  /// - A [SizeConfig.verticalSpaceSmall] widget.
  /// - An [Expanded] widget that contains a [Txt] widget.
  ///
  /// The [ViewAppImage] widget displays an image with the specified [assetPath].
  /// The [Txt] widget displays the specified [text] with the specified color.
  /// If [text] is null, an empty string is displayed.
  ///
  /// The color of the [ViewAppImage] and [Txt] widgets is determined by the value of [isActive].
  /// If [isActive] is true, the color is [Colorz.primary].
  /// Otherwise, the color is [Colorz.gray].
  ///
  /// Parameters:
  /// - `assetPath`: The path to the image asset.
  /// - `text`: The text to be displayed.
  /// - `isActive`: Indicates whether the icon is active or not.
  /// - `onTap`: The callback function to be called when the widget is tapped.
  ///
  /// Returns:
  /// A [Widget] representing the bottom navigation bar icon.
  Widget _bottomBarIcon(
      {String? assetPath,
      String? text,
      bool isActive = false,
      Function? onTap}) {
    return Expanded(
      child: Inkk(
          onTap: () {
            if (onTap != null) {
              onTap();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizeConfig.verticalSpaceSmall(),
              Center(
                child: ViewAppImage(
                  assetsUrl: assetPath,
                  height: 30.sp,
                  width: 30.sp,
                  color: isActive ? Colorz.blueAccent : Colorz.gray,
                ),
              ),
              SizeConfig.verticalSpaceSmall(),
              Expanded(
                child: Txt(
                  text ?? '',
                  color: isActive ? Colorz.blueAccent : Colorz.gray,
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      builder: (context, state) {
        return Cardd(
          child: SizedBox(
            height: 70.sp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomBarIcon(
                    assetPath: Assets.home,
                    text: 'Home',
                    isActive: state.pageIndex==0,
                    onTap: () {
                      context.read<DashBoardBloc>().add(const ChangeTabDashBoardEvent(0));
                    }),
                _bottomBarIcon(
                    assetPath: Assets.favourite,
                    text: 'Favourite',
                    isActive: state.pageIndex==1,
                    onTap: () {
                      context.read<DashBoardBloc>().add(const ChangeTabDashBoardEvent(1));
                    }),
                
                _bottomBarIcon(
                    assetPath: Assets.user,
                    text: 'User',
                    isActive: state.pageIndex==2,
                    onTap: () {
                      context.read<DashBoardBloc>().add(const ChangeTabDashBoardEvent(2));
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
