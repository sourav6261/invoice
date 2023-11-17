import 'package:flutter/material.dart';
import 'package:invoice/core/utils/size_utils.dart';
import 'package:invoice/routes/app_routes.dart';
import 'package:invoice/theme/app_decoration.dart';
import 'package:invoice/theme/custom_text_style.dart';
import 'package:invoice/theme/theme_helper.dart';
import 'package:invoice/widgets/custom_elevated_button.dart';
import 'package:invoice/widgets/custom_text_form_field.dart';


// ignore_for_file: must_be_immutable
class CreateActivitiesOneDialog extends StatelessWidget {
  CreateActivitiesOneDialog({Key? key}) : super(key: key);

  TextEditingController editText1Controller = TextEditingController();

  TextEditingController editText2Controller = TextEditingController();

  TextEditingController editText3Controller = TextEditingController();

  TextEditingController editText4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: 337.h,
        padding: EdgeInsets.symmetric(vertical: 14.v),
        decoration: AppDecoration.fillOnPrimaryContainer
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.v),
              Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Text("Add to do list",
                      style: CustomTextStyles.titleSmallPrimary)),
              SizedBox(height: 18.v),
              _buildActivityDays(context),
              SizedBox(height: 25.v),
              Padding(
                  padding: EdgeInsets.only(left: 30.h),
                  child: Text("Activity 1",
                      style: CustomTextStyles.labelLargeSecondaryContainer)),
              SizedBox(height: 6.v),
              _buildEditText1(context),
              SizedBox(height: 22.v),
              Padding(
                  padding: EdgeInsets.only(left: 30.h),
                  child: Text("Activity 2",
                      style: CustomTextStyles.labelLargeSecondaryContainer)),
              SizedBox(height: 6.v),
              _buildEditText2(context),
              SizedBox(height: 22.v),
              Padding(
                  padding: EdgeInsets.only(left: 30.h),
                  child: Text("Activity 3",
                      style: CustomTextStyles.labelLargeSecondaryContainer)),
              SizedBox(height: 6.v),
              _buildEditText3(context),
              SizedBox(height: 22.v),
              Padding(
                  padding: EdgeInsets.only(left: 30.h),
                  child: Text("Activity 4",
                      style: CustomTextStyles.labelLargeSecondaryContainer)),
              SizedBox(height: 6.v),
              _buildEditText4(context),
              SizedBox(height: 31.v),
              _buildAddButton(context)
            ]));
  }

  /// Section Widget
  Widget _buildActivityDays(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 18.h),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  width: 59.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.h, vertical: 4.v),
                  decoration: AppDecoration.fillYellow
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Text("SUN", style: theme.textTheme.labelLarge)),
              Container(
                  width: 59.h,
                  margin: EdgeInsets.only(left: 10.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.h, vertical: 4.v),
                  decoration: AppDecoration.fillBlueGray
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Text("MON", style: theme.textTheme.labelLarge)),
              Container(
                  width: 59.h,
                  margin: EdgeInsets.only(left: 10.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 4.v),
                  decoration: AppDecoration.fillBlueGray
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Text("TUE", style: theme.textTheme.labelLarge)),
              Container(
                  width: 59.h,
                  margin: EdgeInsets.only(left: 10.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 4.v),
                  decoration: AppDecoration.fillBlueGray
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Text("WED", style: theme.textTheme.labelLarge)),
              Container(
                  width: 43.h,
                  margin: EdgeInsets.only(left: 10.h),
                  padding: EdgeInsets.symmetric(vertical: 4.v),
                  decoration: AppDecoration.fillBlueGray
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Text("THU", style: theme.textTheme.labelLarge))
            ])));
  }

  /// Section Widget
  Widget _buildEditText1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 19.h),
        child: CustomTextFormField(
            controller: editText1Controller, alignment: Alignment.center));
  }

  /// Section Widget
  Widget _buildEditText2(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 19.h),
        child: CustomTextFormField(
            controller: editText2Controller, alignment: Alignment.center));
  }

  /// Section Widget
  Widget _buildEditText3(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 19.h),
        child: CustomTextFormField(
            controller: editText3Controller, alignment: Alignment.center));
  }

  /// Section Widget
  Widget _buildEditText4(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 19.h),
        child: CustomTextFormField(
            controller: editText4Controller,
            textInputAction: TextInputAction.done,
            alignment: Alignment.center));
  }

  /// Section Widget
  Widget _buildAddButton(BuildContext context) {
    return CustomElevatedButton(
        text: "ADD",
        margin: EdgeInsets.only(left: 16.h, right: 15.h),
        onPressed: () {
          onTapAddButton(context);
        },
        alignment: Alignment.center);
  }

  /// Navigates to the toDoListScreen when the action is triggered.
  onTapAddButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.toDoListScreen);
  }
}