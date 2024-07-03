
part of 'Widgets.dart';
/// App common logo widget
class AppLogo extends StatelessWidget {
  /// height, width of logo
  final double?height,width;
  /// constructor
  const AppLogo({super.key,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return ViewAppImage(
      height: height,width: width,
      assetsUrl: Assets.logoTransparent,
    );
  }
}
