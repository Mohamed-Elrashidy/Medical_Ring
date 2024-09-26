import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconButton extends StatelessWidget {
  SvgIconButton({required this.svgImage,required this.onTap,this.width=24,this.height=24,super.key});
  String svgImage;
  var onTap;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: SvgPicture.asset(svgImage,width:width.w,height: height.h,),
      ),
    );
  }
}
