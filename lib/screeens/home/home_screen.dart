import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movement_shipment/provider/animation_provider.dart';
import 'package:movement_shipment/utils/colors.dart';
import 'package:movement_shipment/utils/mockData.dart';
import 'package:provider/provider.dart';

import '../../utils/animations.dart';
import '../../utils/widgets.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: animateDuration(),
    );
    _slideAnimation = slideAnimationTopTOBottom().animate(_animationController);
    _animationController.forward()
    ;
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return whiteStatusBar(child:
    Scaffold(
      backgroundColor: AppColors.whiteFA,
      body: Container(
        child: Column(children: [
          SlideTransition(position: _slideAnimation,
              child: homeInitialAppBar()),
          Expanded(
            child: AnimatedCrossFade(
                firstChild: homeScreenMainDesigns(),
                secondChild: suggestionWidget(),
                crossFadeState: context.watch<AnimationProvider>().homefirstAppBar == false?
                CrossFadeState.showSecond:
                CrossFadeState.showFirst,
                duration: animateDuration()
            ),
          ),


        ],),
      ),
    )
    );
  }

  Container homeScreenMainDesigns() => Container(
    child: SingleChildScrollView(child:
    Column(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        gapH(20.h),
        Padding(padding: EdgeInsets.only(left: 16.w),
          child: ctmTxtGroteskSB("Tracking",AppColors.black,18.sp),),
        gapH(20.h),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16.w,),
          padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              cardShadow()
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    ctmTxtGroteskReg("Shipping Number",AppColors.hash,12.sp),
                    gapH(8.h),
                    ctmTxtGroteskSB("NEJ2001234567",AppColors.black,16.sp),
                  ],),
                  Spacer(),
                  Image.asset("assets/images/fork.png",width: 50.w,height: 50.h,),
                ],
              ),
              gapH(10.h),
              Divider(),
              gapH(10.h),
              senderWidget(title: 'Sender',
                  description: 'Atlanta 5243',
                  time: ' 2 days - 3 days'),
              gapH(20.h),
              receiverWidget(title: 'Receiver',
                  description: 'Chicago 622',
                  time: 'Waiting to collect'),
              gapH(10.h),
              Divider(),
              gapH(10.h),
              GestureDetector(
                onTap: (){},
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add,color: AppColors.orange,size: 25.r,),
                    gapW(5.w),
                    ctmTxtGroteskMid("Add Stop",AppColors.orange,15.sp,weight: FontWeight.w600),
                  ],
                ),
              )
              
            ],
          ),

        )


      ],),
      gapH(20.h),
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 16.w),
            child: ctmTxtGroteskSB("Available vehicles",AppColors.black,18.sp),),
          gapH(10.h),
          Container(height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
             itemCount: 5,
              itemBuilder: (context, index) {
               return freightTypeWidget();
              },
          ),
          )


      ],),
    ],),),
  );

  Container freightTypeWidget() {
    return Container(
          width: 200.w,height: 190.h,
          margin: EdgeInsets.symmetric(horizontal: 6.w,),
          //padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.white,

          ),
          child: Column(
            children: [
              gapH(12.h),
              Container(width: double.infinity,
                padding: EdgeInsets.only(left: 16.w),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ctmTxtGroteskMid("Cargo freight",AppColors.black,16.sp,weight: FontWeight.w500),
                    gapH(2.h),
                    ctmTxtGroteskReg("Reliable",AppColors.hash,12.sp,weight: FontWeight.w500),
                  ],
                ),
              ),
              Spacer(),
              Align(alignment: Alignment.centerRight,
                child:Image.asset("assets/images/truck.png",
                  width: 120.w,height: 120.h,)
              ),
            ],
          ),
        );
  }


  Widget suggestionWidget() {
    return Column(children: [
          Container(
            width: double.infinity,height: 300.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                cardShadow()
              ],
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return searchSuggestionWidget(
                    title: productList[index].title,
                    description: productList[index].description);
              },
            ),
          )
        ],);
  }

  Column animatedAppBarContent({required bool showFirst}) {
    return Column(mainAxisAlignment: MainAxisAlignment.end,
      children: [
        gapH(20.h),
        AnimatedCrossFade(
            firstChild: Column(children: [
              Row(
                children: [
                  Container(
                    width: 45.w,height: 45.h,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/profile_image.png",))
                    ),
                  ),
                  gapW(20.w),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.near_me,size: 20.r,color: AppColors.whiteFA,),
                          gapW(5.w),
                          ctmTxtGroteskReg("Your location",AppColors.whiteD8,14.sp,weight: FontWeight.w600)
                        ],),
                      gapH(4.h),
                      Row(
                        children: [
                          ctmTxtGroteskSB("Wertheimer, illinois",
                              AppColors.white,18.sp,weight: FontWeight.w600),
                          gapW(4.w),
                          Icon(Icons.keyboard_arrow_down,size: 20.r,color: AppColors.white,),
                        ],
                      ),
                    ],),
                  const Spacer(),
                  Container(
                    width: 45.w,height: 45.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white
                    ),
                    child: Center(child: Icon(Icons.notifications_outlined,color: AppColors.black,size: 30.r,)),
                  ),

                ],
              ),
              gapH(30.h),
            ],),
            secondChild: SizedBox(),
            crossFadeState: showFirst == false? CrossFadeState.showSecond:CrossFadeState.showFirst,
            duration: animateDuration()
        ),
        SizedBox(width:MediaQuery.of(context).size.width,
          child: Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedCrossFade(
                  firstChild: SizedBox(width: 0,),
                  secondChild:backArrow(tap: () {
                    context.read<AnimationProvider>().enableHomeAppBar(true, context);
                  }, size: showFirst == false? 25.w: 0.w,),
                  crossFadeState: showFirst == false? CrossFadeState.showSecond:CrossFadeState.showFirst,
                  duration: animateDuration1000()
              ),
              GestureDetector(
                onTap: (){
                  context.read<AnimationProvider>().enableHomeAppBar(false, context);
                  setState(() {
                  });
                },
                child: AnimatedContainer(
                  width: showFirst == false? 350.w: 395.w,
                  height:60.h,
                  duration: animateDuration1000(),
                  transformAlignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.r),
                      color: AppColors.white
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      gapW(15.w),
                      Icon(Icons.search,color: AppColors.primary,size: 30.r),
                      gapW(10.w),
                      Expanded(
                        child: TextFormField(
                          //focusNode: _focusNode,
                          enabled: showFirst == false? true: false,
                          cursorColor: AppColors.primary,
                          autofocus: showFirst == false? true: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: "Enter the receipt number...",
                            filled: false,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColors.hash,
                              fontSize: 16.sp,
                              fontFamily: 'HKGroteskRegular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                        ),
                      ),
                      gapW(10.w),
                      flipBtn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        gapH(20.h),
      ],);
  }
  Container homeInitialAppBar() {
    return Container(
      width: MediaQuery.of(context).size.width, color: AppColors.primary,
      padding: screenPad(),
      child: SafeArea(top: true,
        child: animatedAppBarContent(showFirst: context.watch<AnimationProvider>().homefirstAppBar == true? true:false),
      ),
    );
  }



}
