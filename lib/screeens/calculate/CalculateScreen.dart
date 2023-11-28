import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movement_shipment/provider/navigation_provider.dart';
import 'package:movement_shipment/screeens/calculate/estimationScreen.dart';
import 'package:movement_shipment/utils/mockData.dart';
import 'package:provider/provider.dart';

import '../../utils/animations.dart';
import '../../utils/colors.dart';
import '../../utils/widgets.dart';



class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen>with TickerProviderStateMixin {
  late TabController tabController;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _slideAnimation2;
  TextEditingController sendController = TextEditingController();
  TextEditingController receiveController = TextEditingController();
  TextEditingController approveController = TextEditingController();
  TextEditingController boxController = TextEditingController();
  String selectedCategory = "";
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    boxController.text ="Box";
    _slideAnimation = slideAnimation2().animate(_animationController);
    _slideAnimation2 = slideAnimation().animate(_animationController);
    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.whiteFA,
        body: Column(children: [
          SlideTransition(
              position: _slideAnimation,
              child: appCalculateBar(context)),
          gapH(20.h),
          Expanded(child:
          SingleChildScrollView(child: Column(children: [
           Padding(
             padding: screenPad(),
             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 ctmTxtGroteskSB("Destination",AppColors.black,18.sp,weight:FontWeight.w700),
                 gapH(20.h),
                 Container(width: double.infinity,
                   padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 18.h),
                   decoration: BoxDecoration(
                     color: AppColors.white,borderRadius: BorderRadius.circular(15.r)
                   ),
                   child: Column(
                     children: [
                       IconAndTextInputWidget(
                           controller:sendController,
                           hint: "Sender location",
                           enabled: true,icon:icon25("assets/icon/upload.png"),),
                       gapH(20.h),
                       IconAndTextInputWidget(
                         controller:receiveController,
                         hint: "Receiver location",
                         enabled: true,icon:icon25("assets/icon/download.png"),),
                       gapH(20.h),
                       IconAndTextInputWidget(
                         controller: approveController,
                         hint: "Approx weight",
                         enabled: true,icon:icon25("assets/icon/scale.png"),),

                 ],),)
             ],),
           ),
            gapH(20.h),
            Padding(
              padding: screenPad(),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ctmTxtGroteskSB("Packaging",AppColors.black,18.sp,weight:FontWeight.w700),
                  gapH(8.h),
                  ctmTxtGroteskReg("What are you sending?",AppColors.hash,14.sp,weight:FontWeight.w600),
                  gapH(20.h),
                  IconAndTextInputWidget(
                    controller:boxController,
                    hint: "Package type",
                    enabled: false,icon:icon26("assets/images/box_image.png"),),
                ],),
            ),
            gapH(20.h),
            Padding(
              padding: screenPad(),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ctmTxtGroteskSB("Categories",AppColors.black,18.sp,weight:FontWeight.w700),
                  gapH(8.h),
                  ctmTxtGroteskReg("What is the category?",AppColors.hash,14.sp,weight:FontWeight.w600),
                  gapH(20.h),
                  ContainerGrid(
                    categoryTypesList:categoryTypesList,
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                    }, selectedCategory: selectedCategory,
                  ),

                ],),
            ),

          ],),)),
          SlideTransition(
              position: _slideAnimation2,
              child: orangeBtn(title: 'Calculate', tap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>
                const EstimationScreen()));
              }))


        ],),
      ),
    );
  }




  Container appCalculateBar(BuildContext context) {
    return Container(
        width: double.infinity,
        color: AppColors.primary,
        child: SafeArea(top: true,
          child: Column(
            children: [
              gapH(20.h),
              Padding(
                padding: screenPad(),
                child: Row(children: [
                  backArrow(tap: () {
                    Provider.of<BottomNavigationProvider>(context, listen: false).setIndex(0,context);
                    FocusManager.instance.primaryFocus?.unfocus();
                  }, size: 20.w),
                  const Spacer(),
                  ctmTxtGroteskSB("Calculate", AppColors.white, 18.sp, weight: FontWeight.w600),
                  const Spacer(),
                  gapW(20.w),
                ],),
              ),
              gapH(30.h),
            ],
          ),
        ),
      );
  }
}



