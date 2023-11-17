import 'package:flutter/material.dart';
import 'package:invoice/core/utils/size_utils.dart';
import 'package:invoice/routes/app_routes.dart';
import 'package:invoice/theme/app_decoration.dart';
import 'package:invoice/theme/custom_text_style.dart';
import 'package:invoice/theme/theme_helper.dart';


class CreateActivitiesDialog extends StatelessWidget {
  const CreateActivitiesDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: 337.h,
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 2.v),
        decoration: AppDecoration.fillOnPrimaryContainer
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 9.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 21.v),
                            child: Text("Monday Activities",
                                style: CustomTextStyles.titleSmallPrimary)),
                        GestureDetector(
                            onTap: () {
                              onTapTxtText(context);
                            },
                            child:
                                Text("+", style: theme.textTheme.headlineLarge))
                      ])),
              SizedBox(height: 23.v),
              Container(
                  width: 80.h,
                  margin: EdgeInsets.only(left: 16.h),
                  child: Text("GYM\n\nOffice\n\nMeeting\n\nMovie",
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleSmallGray800)),
              SizedBox(height: 67.v)
            ]));
  }

  /// Navigates to the toDoListScreen when the action is triggered.
  onTapTxtText(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.toDoListScreen);
  }
}