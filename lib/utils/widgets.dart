import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movement_shipment/utils/colors.dart';

AnnotatedRegion<SystemUiOverlayStyle> whiteStatusBar({required Widget child}) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value:const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness:  Brightness.light
    ),
    child: child,
  );
}
IconData getIconForIndex(int index) {
  switch (index) {
    case 0:
      return Icons.home_outlined;
    case 1:
      return Icons.calculate_outlined;
    case 2:
      return Icons.history;
    case 3:
      return Icons.person_outline;
    default:
      return Icons.home_outlined;
  }
}

String getLabelForIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Calculate';
    case 2:
      return 'Shipment';
    case 3:
      return 'Profile';
    default:
      return 'Home';
  }
}
int getShipVal(int index) {
  switch (index) {
    case 0:
      return 12;
    case 1:
      return 5;
    case 2:
      return 8;
    case 3:
      return 10;
    case 4:
      return 11;
    default:
      return 12;
  }
}

String getShipTitle(int index) {
  switch (index) {
    case 0:
      return 'All';
    case 1:
      return 'Completed';
    case 2:
      return 'In progress';
    case 3:
      return 'Pending';
    case 4:
      return 'Cancelled';
    default:
      return 'All';
  }
}
int getShipIndicatorSize(int index) {
  switch (index) {
    case 0:
      return 60;
    case 1:
      return 110;
    case 2:
      return 110;
    case 3:
      return 110;
    case 4:
      return 110;
    default:
      return 60;
  }
}

Text ctmTxtGroteskSB(title,color,size,{weight = FontWeight.w500,maxLines = 1, textAlign = TextAlign.start}) {
  return Text(title,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: 'HKGroteskSemiBold',
      fontWeight: weight,
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}
Text ctmTxtGroteskReg(title,color,size,{weight = FontWeight.w400,maxLines = 1, textAlign = TextAlign.start}) {
  return Text(title,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: 'HKGroteskRegular',
      fontWeight: weight,
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}
Text ctmTxtGroteskMid(title,color,size,{weight = FontWeight.w500,maxLines = 1, textAlign = TextAlign.start}) {
  return Text(title,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: 'HKGroteskMedium',
      fontWeight: weight,
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}
SizedBox gapH(height) => SizedBox(height: height,);
SizedBox gapW(width) => SizedBox(width: width,);

EdgeInsets screenPad() => EdgeInsets.symmetric(horizontal: 16.w);

BoxShadow cardShadow() {
  return BoxShadow(
    color: AppColors.black.withOpacity(0.10),
    spreadRadius: 0,
    blurRadius: 10.r,
    offset: const Offset(0, 2),
  );
}
BoxShadow cardShadow2() {
  return BoxShadow(
    color: AppColors.black.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, 2),
  );
}
Column senderWidget({required String title,
  required String description,required String time
}) {
  return Column(children: [
    Row(children: [
      Container(
        width: 30.w,height: 30.h,
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent.withOpacity(0.30),
          shape: BoxShape.circle,

        ),
        child: Center(child: Image.asset("assets/images/send.png",width: 15.w,height: 15.h,),),
      ),
      gapW(10.w),
      SizedBox(width: 200.w,
        child: Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ctmTxtGroteskReg(title,AppColors.hash,12.sp),
                gapH(5.h),
                ctmTxtGroteskMid(description,AppColors.black.withOpacity(0.80),14.sp,),
              ],),
          ],
        ),
      ),
      //const Spacer(),
      title == "Receiver" ?
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ctmTxtGroteskReg("Status",AppColors.hash,12.sp),
          gapH(5.h),
          ctmTxtGroteskMid(time,AppColors.black.withOpacity(0.80),14.sp,),
        ],):
      Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ctmTxtGroteskReg("Time",AppColors.hash,12.sp),
              gapH(5.h),
              Row(
                children: [
                  Container(width: 10.w,height: 10.r,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,color: Colors.green
                    ),),
                  ctmTxtGroteskMid(time,AppColors.black.withOpacity(0.80),14.sp,),
                ],
              ),
            ],),
        ],
      ),

    ],)

  ],);
}
Column receiverWidget({required String title,
  required String description,required String time
}) {
  return Column(children: [
    Row(children: [
      Container(
        width: 30.w,height: 30.h,
        decoration: BoxDecoration(
          color: Colors.greenAccent.withOpacity(0.30),
          shape: BoxShape.circle,

        ),
        child: Center(child: Image.asset("assets/images/receiver.png",width: 15.w,height: 15.h,),),
      ),
      gapW(10.w),
      SizedBox(width: 200.w,
        child: Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ctmTxtGroteskReg(title,AppColors.hash,12.sp),
                gapH(5.h),
                ctmTxtGroteskMid(description,AppColors.black.withOpacity(0.80),14.sp,),
              ],),
          ],
        ),
      ),
      //const Spacer(),
      title == "Receiver" ?
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ctmTxtGroteskReg("Status",AppColors.hash,12.sp),
          gapH(5.h),
          ctmTxtGroteskMid(time,AppColors.black.withOpacity(0.80),14.sp,),
        ],):
      Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ctmTxtGroteskReg("Time",AppColors.hash,12.sp),
              gapH(5.h),
              Row(
                children: [
                  Container(width: 10.w,height: 10.r,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,color: Colors.green
                    ),),
                  ctmTxtGroteskMid(time,AppColors.black.withOpacity(0.80),14.sp,),
                ],
              ),
            ],),
        ],
      ),

    ],)

  ],);
}
Container flipBtn() {
  return Container(
    width: 45.w,height: 45.h,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.orange
    ),
    child: Transform.rotate(
        angle: 3.14159 / 2,
        child: Icon(Icons.flip,color: AppColors.white,size: 25.r,)),
  );
}

Widget backArrow({required Function()tap,required double size}) {
  return Padding(
    padding: EdgeInsets.only(right: 20.w),
    child: GestureDetector(onTap: tap,
      child: Icon(Icons.arrow_back_ios_new_sharp,
        color: AppColors.white,size: size,),
    ),
  );
}
AnnotatedRegion<SystemUiOverlayStyle> lightStatusBar(BuildContext context,widget) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value:const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness:  Brightness.light,
    ),
    child: widget,
  );
}
class IconAndTextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool enabled;
  final Widget icon;
  const IconAndTextInputWidget({
    super.key, required this.controller, required this.hint, required this.enabled, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: !enabled? AppColors.white: AppColors.whiteD8.withOpacity(0.20),
          borderRadius: BorderRadius.circular(15.r)
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 5.h),
      child: Row(children: [
        icon,
        gapW(8.w),
        SizedBox(height: 30.h,
            child: VerticalDivider(
              color: AppColors.hash,width: 0.5.w,
            )),
        gapW(10.w),
        Expanded(
          child: TextField(
            controller: controller,
            enabled: enabled,
            cursorColor: AppColors.black,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16.sp,
              fontFamily: 'HKGroteskMedium',
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              filled: false,
              hintText: hint,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        !enabled? const Icon(Icons.keyboard_arrow_down,color: AppColors.hash,):SizedBox()

      ],),);
  }
}
Image icon26(icon) => Image.asset(icon,width: 25.w,height: 25.w,);
Image icon25(icon) => Image.asset(icon,width: 25.w,height: 25.w,color: AppColors.hash,);
class ContainerGrid extends StatelessWidget {
  final List<String> categoryTypesList;
  final Function(String) onCategorySelected;
  final String? selectedCategory;

  const ContainerGrid({super.key,
    required this.categoryTypesList,
    required this.onCategorySelected, required this.selectedCategory,
  });
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,height: 100.h,
      alignment: Alignment.topCenter,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 40.h,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 10.w,
        ),
        itemCount: categoryTypesList.length,
        itemBuilder: (context, index) {
          String category = categoryTypesList[index];
          return GestureDetector(
            onTap: () {
              onCategorySelected(category);
            },
            child: Container(
              decoration: BoxDecoration(
                color: selectedCategory == category
                    ? AppColors.blackO2 // Change color for the selected container
                    : AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: selectedCategory == category
                    ? null:
                Border.all(color: AppColors.black.withOpacity(0.50),width: 0.5.r),
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selectedCategory == category?
                  Padding(padding: EdgeInsets.only(right: 4.w),
                      child: Icon(Icons.done,color: AppColors.white,size: 20.r,))
                      :SizedBox(),
                  ctmTxtGroteskReg(category,
                      selectedCategory == category?
                      AppColors.white: AppColors.black,
                      12.sp,maxLines: 1,weight: selectedCategory == category? FontWeight.w600:FontWeight.w500),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
GestureDetector orangeBtn({required String title, required Function() tap}) {
  return GestureDetector(onTap: tap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
      padding: EdgeInsets.symmetric(vertical: 15.h ),
      decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.circular(25.r)
      ),child: Center(child:
    ctmTxtGroteskSB(title,AppColors.white,16.sp),),
    ),
  );
}
Container shipmentHistoryWidget({required String arrival,required String description, required String amount, required String date }) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.fromLTRB(16.w, 0,16.w,20.h),
    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      color: AppColors.white,
    ),child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      inProgressWidget(),
      gapH(10.h),
      Row(
        children: [
          SizedBox(width: 250.w,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ctmTxtGroteskMid(arrival,AppColors.black,16.sp,weight: FontWeight.w500),
                gapH(10.h),
                ctmTxtGroteskReg(description,AppColors.hash,13.sp,
                    weight: FontWeight.w500,maxLines: 2),
                gapH(10.h),
                Row(children: [
                  ctmTxtGroteskMid(amount,AppColors.primary,13.sp,weight: FontWeight.w500),
                  ctmTxtGroteskReg(date,AppColors.hash,12.sp,
                      weight: FontWeight.w500,maxLines: 1),
                ],),

              ],
            ),
          ),
          const Spacer(),
          Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/box_image.png",width: 100.w,height: 80.h,),
              gapH(50.h)
            ],
          )
        ],
      ),




    ],),

  );
}

Row inProgressWidget() {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.hash.withOpacity(0.10)
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cached,color: Colors.green,size: 15.r,),
            gapW(4.w),
            ctmTxtGroteskReg("in-progress",Colors.green,12.sp,),
          ],),
      ),
    ],
  );
}
Container searchSuggestionWidget({required String title,
  required String description}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8),
    child: Column(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40.w,height: 40.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: Center(child: Image.asset("assets/icon/parcel.png",
                width: 20.w,height: 20.h,color: AppColors.white,fit: BoxFit.contain,
              )),
            ),
            gapW(15.w),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ctmTxtGroteskSB(title,AppColors.black,16.sp,
                    weight: FontWeight.w600,maxLines: 1),
                gapH(4.h),
                ctmTxtGroteskMid(description,AppColors.whiteD8,16.sp,
                    weight: FontWeight.w600,maxLines: 1),
              ],
            ),
          ],),
        gapH(8.h),
        Divider(color: AppColors.whiteD8.withOpacity(0.50),thickness: 1.r,),
      ],),
  );
}



