part of  'tiles.dart';
/// small tile
class SmallTile extends StatelessWidget {
  /// onTap function
  final Function? onTap;
  /// files
  final String? title,imageUrl,emptyImageAsset;
  ///enable asset image
  final bool isAssetsImage;
  /// constructor
  const SmallTile({super.key, this.imageUrl,this.emptyImageAsset,this.onTap,this.title,this.isAssetsImage =false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap!=null) {
          onTap!();
        }
      },
      child: Container(
        height: 100.sp,
        width:  100.sp,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colorz.white,
            boxShadow: SizeConfig.appShadow,
            borderRadius: BorderRadius.circular(30.sp),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.spaceBetween),
          child: Column(
            children: [
              SizeConfig.verticalSpaceMedium(),
              ViewAppImage(
                radius: 5,
                width: 50.sp,
                height: 50.sp,
                emptyAssetUrl: emptyImageAsset,
                assetsUrl:isAssetsImage?imageUrl:null,
                imageUrl: isAssetsImage?null:imageUrl,
              ),
              SizeConfig.verticalSpaceSmall(),
              Txt(title??'',maxlines: 3,
                textAlign: TextAlign.center,
                color: Colorz.black,
                ),

            ],
          ),
        ),
      ),
    );
  }
}
