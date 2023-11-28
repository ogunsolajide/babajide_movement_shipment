import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/navigation_provider.dart';
import '../../utils/colors.dart';
import '../../utils/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteFA,
      body: Column(children: [
        Container(
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
                    ctmTxtGroteskSB("Profile", AppColors.white, 18.sp, weight: FontWeight.w600),
                    const Spacer(),
                    gapW(20.w),
                  ],),
                ),
                gapH(30.h),
              ],
            ),
          ),
        ),


      ],),
    );
  }
}
