import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmart/core/cache/cache_helper.dart';
import 'package:quickmart/core/networking/end_points.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/theming/colors.dart';
import 'package:quickmart/core/widgets/app_text_button.dart';
import 'package:quickmart/features/login/ui/login_screen.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}
void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
            child: Text(
                'Logout',style: TextStyles.font16BlackBold,
            )),
        content: Container(
          height: 60,
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                "Are You Sure You Want",style: TextStyles.font12BlackRegular,

              ),
              Text(
                "To Logout ?",style: TextStyles.font12BlackRegular,

              ),
            ],
          ),
        ),
        actions: <Widget>[
          Divider(color: ColorsManager.gray, height: 0.5),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              AppTextButton(
                buttonText: "Logout !",
                backgroundColor: Colors.red.withOpacity(.4),
                textStyle: TextStyle(color: Colors.white),
                borderSideColor: Colors.red.withOpacity(.3),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 8,
              ),
              InkWell(onTap: () {
                Navigator.of(context).pop();
              },
                child: Text(
                  "Cancel",

                ),
              ),
            ],
          )
        ],
      );
    },
  );
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0.r,
            backgroundImage: NetworkImage('https://i0.wp.com/icon-library.com/images/no-profile-picture-icon/no-profile-picture-icon-18.jpg'),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${CacheHelper().getData(key: ApiKey.userName)}',
                style: TextStyles.font24WhiteBold,
              ),
              SizedBox(height: 4.h),
              Text(
                '${CacheHelper().getData(key: ApiKey.userEmail)}',
                style: TextStyles.font16WhiteMedium,
              ),
            ],
          ),
          Spacer(),
          InkWell(onTap: () {
            _showAlertDialog(context);
          },child: SvgPicture.asset('assets/svgs/logout.svg',width: 32.w,height: 32.h,))
        ],
      ),
    );
  }
}
