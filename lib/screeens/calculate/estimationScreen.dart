import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movement_shipment/utils/colors.dart';
import 'package:movement_shipment/utils/widgets.dart';

class EstimationScreen extends StatefulWidget {
  const EstimationScreen({super.key});

  @override
  State<EstimationScreen> createState() => _EstimationScreenState();
}

class _EstimationScreenState extends State<EstimationScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _countingAnimation;

  final int targetValue = 1297;
  final Duration animationDuration = Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
    _countingAnimation = IntTween(begin: 0, end: targetValue).animate(_animationController);
    _animationController.forward();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness:  Brightness.dark,
      ),
      child: Scaffold(
        body: Center(
          child: AnimatedBuilder(
            animation: _countingAnimation,
            builder: (context, child) {
              return Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/move.png",width: 200.w,height: 50.h,),
                  gapH(60.h),
                  Center(child: Image.asset("assets/images/box_image.png",width: 300.w,height: 200.h,)),
                  gapH(30.h),
                  ctmTxtGroteskMid("Total Estimated Amount",
                    AppColors.black,25.sp,),
                  gapH(10.h),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ctmTxtGroteskMid("\$${_countingAnimation.value.toString()}",
                          Colors.greenAccent,20.sp,weight: FontWeight.w800),
                      ctmTxtGroteskMid(" USD",
                          Colors.greenAccent,16.sp,weight: FontWeight.w700),
                    ],
                  ),
                  gapH(10.h),
                  SizedBox(width: 300.w,
                    child: ctmTxtGroteskMid("This amount is estimated this will vary if you change your location or weight",
                      AppColors.hash,16.sp,maxLines: 2,textAlign: TextAlign.center),
                  ),
                  orangeBtn(title: "Back to home", tap:(){
                    Navigator.pop(context);
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
