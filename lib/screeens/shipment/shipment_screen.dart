import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movement_shipment/utils/colors.dart';
import 'package:movement_shipment/utils/widgets.dart';
import 'package:provider/provider.dart';

import '../../provider/navigation_provider.dart';
import '../../utils/animations.dart';



class ShipmentScreen extends StatefulWidget {
  const ShipmentScreen({super.key});

  @override
  State<ShipmentScreen> createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen>with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _animationController = AnimationController(
      vsync: this,
      duration: animateDuration(),
    );
    _slideAnimation = slideAnimation2().animate(_animationController);
    _animationController.forward()
    ;
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  List<Widget> pages =  [
    MyListWidget(length: 20,),
    MyListWidget(length: 12,),
    MyListWidget(length: 13,),
    MyListWidget(length: 14,),
    MyListWidget(length: 15,),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteFA,
        body: Column(
          children: [
            SlideTransition(
                position: _slideAnimation,
                child: appBar(context)),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: pages,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container appBar(BuildContext context) {
    return Container(
            width: double.infinity,
            color: AppColors.primary,
            child: SafeArea(
              top: true,
              child: Column(
                children: [
                  gapH(10.h),
                  Padding(
                    padding: screenPad(),
                    child: Row(
                      children: [
                        backArrow(tap: () {
                          Provider.of<BottomNavigationProvider>(context, listen: false).setIndex(0,context);
                        }, size: 20.w),
                        Spacer(),
                        ctmTxtGroteskSB("Shipment history", AppColors.white, 18.sp, weight: FontWeight.w600),
                        Spacer(),
                        gapW(20.w),
                      ],
                    ),
                  ),
                  gapH(20.h),
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: AppColors.orange,
                    indicatorSize: TabBarIndicatorSize.label,
                    padding: EdgeInsets.zero,
                    tabAlignment: TabAlignment.start,
                    labelColor: AppColors.orange,
                    tabs: [
                      tabWidget(title: 'All', value: "10", index: 0,),
                      tabWidget(title: 'Completed', value: "20", index: 1,),
                      tabWidget(title: 'In progress', value: "12", index: 2,),
                      tabWidget(title: 'Pending', value: "13", index: 3,),
                      tabWidget(title: 'Cancelled', value: "18", index: 4,),
                    ],
                  )
                ],
              ),
            ),
          );
  }

  Widget tabWidget({required String title, required String value, required int index,}) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _tabController.index = index;
        //  selectedIndex = _tabController.index;
        });
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0.w, 15.h, 0.w, 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ctmTxtGroteskSB(title, _tabController.index == index ? AppColors.white : AppColors.white.withOpacity(0.60),
                15.sp, weight: FontWeight.w700),
            gapW(4.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: _tabController.index == index
                    ? AppColors.orange
                    : AppColors.white.withOpacity(0.20),
              ),
              child: Center(
                child: ctmTxtGroteskMid(value, AppColors.white, 10.sp),
              ),
            ),
          ],
        ),
      ),
    );
    // return DefaultTabController(
    //   length: 5,
    //   child: Scaffold(
    //       resizeToAvoidBottomInset: false,
    //       backgroundColor: AppColors.whiteFA,
    //       body: Column(children: [
    //         Container(
    //           width: double.infinity,
    //           color: AppColors.primary,
    //           child: SafeArea(top: true,
    //             child: Column(
    //               children: [
    //                 gapH(10.h),
    //                 Padding(
    //                   padding: screenPad(),
    //                   child: Row(children: [
    //                     backArrow(tap: (){
    //                       Provider.of<BottomNavigationProvider>(context, listen: false)
    //                           .setIndex(0,context);
    //                     }, size: 20.w),
    //                     Spacer(),
    //                     ctmTxtGroteskSB("Shipment history",AppColors.white,18.sp,weight:FontWeight.w600),
    //                     Spacer(),
    //                     gapW(20.w),
    //                   ],),
    //                 ),
    //                 gapH(20.h),
    //                 Container(
    //                   child: TabBar(
    //                     isScrollable: true,
    //                     indicatorColor: AppColors.orange,
    //                     indicatorSize: TabBarIndicatorSize.label,
    //                     padding: EdgeInsets.zero,
    //                     tabAlignment: TabAlignment.start,
    //                     labelColor:AppColors.orange,
    //                     tabs: [
    //                       tabWidget(title: 'All', value: "10", index: 0,),
    //                       tabWidget(title: 'Completed', value: "20", index: 1,),
    //                       tabWidget(title: 'In progress', value: "12", index: 2,),
    //                       tabWidget(title: 'Pending', value: "13", index: 3,),
    //                       tabWidget(title: 'Cancelled', value: "18", index: 4,),
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //         Expanded(child:
    //         TabBarView(
    //           children: pages,
    //         ),
    //         ),
    //       ]
    //       )
    //   ),
    // );
  }


}
class MyListWidget extends StatelessWidget {
  final int length;

  MyListWidget({required this.length});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH(20.h),
        Padding(
          padding: screenPad(),
          child: ctmTxtGroteskSB("Shipments",AppColors.black,20.sp,weight: FontWeight.w700),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: length,
            itemBuilder: (context, index) {
              return shipmentHistoryWidget(
                  arrival: 'Arriving today!',
                  description: 'Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!',
                  amount: '\$1400 USD',
                  date: '• Sep 20, 2023'
              );
            },
          ),
        ),
      ],
    );
  }


}
