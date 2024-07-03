part of 'Widgets.dart';
/// custom Scaffold which will app
class Scaffoldd extends StatelessWidget {
  /// An app bar to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;
  /// body of scaffold
  final Widget? body;
  /// drawer of scaffold
  final Widget?drawer;
  /// The [bottomNavigationBar] is rendered below the [persistentFooterButtons]
  /// and the [body].
  final Widget? bottomNavigationBar;
  /// constructor
  const Scaffoldd({super.key,this.body,this.drawer,this.appBar,this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:bottomNavigationBar ,
      appBar: appBar??AppBar(
        centerTitle: true,
        title: ViewAppImage(
          assetsUrl: Assets.logoTransparent,
          height: 50.sp,
          fit: BoxFit.contain,
        ),
      ),
      drawer:drawer ,
      body: body,
    );
  }
}
