import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movement_shipment/provider/navigation_provider.dart';
import 'package:movement_shipment/screeens/home/home_screen.dart';
import 'package:movement_shipment/screeens/profile/profile_screen.dart';
import 'package:movement_shipment/screeens/shipment/shipment_screen.dart';
import 'package:provider/provider.dart';
import '../utils/animations.dart';
import '../utils/colors.dart';
import '../utils/widgets.dart';
import 'calculate/CalculateScreen.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorScreenState();
}

class _BottomNavigatorScreenState extends State<BottomNavigatorScreen> with TickerProviderStateMixin{
  late TabController tabController;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  List<Widget> screens = const [
    HomeScreen(),
    CalculateScreen(),
    ShipmentScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
   // indicatorPosition = 0;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideAnimation = slideAnimation().animate(_animationController);
    _animationController.forward();
  }



  @override
  Widget build(BuildContext context) {
     int curentIndex = context.watch<BottomNavigationProvider>().currentIndex;
     tabController.index = curentIndex;
     _slideAnimation = slideAnimation().animate(_animationController);
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value:const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness:  Brightness.light,
        ),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body:
              TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: screens,),
            // IndexedStack(
            //   index: context.watch<BottomNavigationProvider>().currentIndex,
            //   children: screens,
            // ),
            bottomNavigationBar:
            AnimatedSwitcher(
              duration: animateDuration1000(),
              child:
              context.watch<BottomNavigationProvider>().currentIndex != 0
                  ?
               const SizedBox.shrink():
              SlideTransition(
                position: _slideAnimation,
                child: SafeArea(
                  bottom: false,
                  right: false,
                  left: false,
                  child:Stack(
                    children: [
                      BottomAppBar(
                        height: 79.h,
                        color: AppColors.white,
                        elevation: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (int i = 0; i < tabController.length; i++)
                              _buildBottomNavItem(
                                getIconForIndex(i),
                                getLabelForIndex(i),
                                i,
                              ),
                          ],
                        ),
                      ),
                      indicator(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  }

  AnimatedPositioned indicator(BuildContext context) {
    return AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: context.watch<BottomNavigationProvider>().indicatorPosition,
                //bottom: 78.h,
                child: Container(
                  width: MediaQuery.of(context).size.width / screens.length,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20.r)
                    
                  ),
                ),
              );
  }
  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        context.read<BottomNavigationProvider>().setIndex(index,context);
      },
      child: SizedBox(width: 80.w,
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            Icon(
              icon,
              color: context.watch<BottomNavigationProvider>().currentIndex == index
                  ? AppColors.primary
                  : AppColors.hash.withOpacity(0.60),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: context.watch<BottomNavigationProvider>().currentIndex == index
                    ? AppColors.primary
                    : AppColors.hash.withOpacity(0.60),
                fontSize: 15.sp,
                fontFamily: 'HKGroteskMedium',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

