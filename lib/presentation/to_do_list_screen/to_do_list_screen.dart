import 'package:flutter/material.dart';
import 'package:invoice/core/utils/size_utils.dart';
import 'package:invoice/presentation/create_activities_dialog/create_activities_dialog.dart';
import 'package:invoice/theme/custom_text_style.dart';
import 'package:invoice/theme/theme_helper.dart';

import '../../theme/app_decoration.dart';
import '../create_activities_one_dialog/create_activities_one_dialog.dart';


class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 52.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text("TO DO LIST",
                              style: theme.textTheme.titleLarge)),
                      SizedBox(height: 9.v),
                      Divider(indent: 6.h, endIndent: 6.h),
                      SizedBox(height: 21.v),
                      Padding(
                          padding: EdgeInsets.only(left: 19.h),
                          child: Text("Monday",
                              style: CustomTextStyles.titleSmallBlack900)),
                      SizedBox(height: 3.v),
                      _buildActivitySection(context),
                      SizedBox(height: 21.v),
                      Padding(
                          padding: EdgeInsets.only(left: 19.h),
                          child: Text("Tuesday",
                              style: CustomTextStyles.titleSmallBlack900)),
                      SizedBox(height: 5.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.h),
                          child: _buildOrderSection(context,
                              activityText: "Activity 1 2 3",
                              text: "+", onTapOrderSection: () {
                            onTapTwo(context);
                          })),
                      SizedBox(height: 21.v),
                      Padding(
                          padding: EdgeInsets.only(left: 19.h),
                          child: Text("Wednesday",
                              style: CustomTextStyles.titleSmallBlack900)),
                      SizedBox(height: 5.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.h),
                          child: _buildOrderSection(context,
                              activityText: "Activity 1 2 3",
                              text: "+", onTapOrderSection: () {
                            onTapOrderSection(context);
                          })),
                      Spacer(),
                      SizedBox(height: 3.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                              height: 75.v,
                              width: 57.h,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        height: 57.adaptSize,
                                        width: 57.adaptSize,
                                        decoration: BoxDecoration(
                                            color: theme.colorScheme.primary,
                                            borderRadius:
                                                BorderRadius.circular(28.h)))),
                                Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                        onTap: () {
                                          onTapTxtText(context);
                                        },
                                        child: Text("+",
                                            style:
                                                theme.textTheme.displayMedium)))
                              ])))
                    ]))));
  }

  /// Section Widget
  Widget _buildActivitySection(BuildContext context) {
    return Container(
        height: 47.v,
        width: 333.h,
        margin: EdgeInsets.only(left: 6.h),
        child: Stack(alignment: Alignment.topRight, children: [
          Align(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () {
                    onTapThree(context);
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 13.h, vertical: 10.v),
                      decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 2.v),
                            Text("Activity 1 2 3",
                                style: theme.textTheme.titleSmall)
                          ])))),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: EdgeInsets.only(right: 7.h),
                  child: Text("+", style: theme.textTheme.headlineLarge)))
        ]));
  }

  /// Common widget
  Widget _buildOrderSection(
    BuildContext context, {
    required String activityText,
    required String text,
    Function? onTapOrderSection,
  }) {
    return GestureDetector(
        onTap: () {
          onTapOrderSection!.call();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.h),
            decoration: AppDecoration.fillGray
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding:
                          EdgeInsets.only(left: 5.h, top: 12.v, bottom: 10.v),
                      child: Text(activityText,
                          style: theme.textTheme.titleSmall!.copyWith(
                              color: theme.colorScheme.secondaryContainer))),
                  Text(text,
                      style: theme.textTheme.headlineLarge!
                          .copyWith(color: theme.colorScheme.onPrimary))
                ])));
  }

  /// Displays a dialog with the [CreateActivitiesDialog] content.
  onTapThree(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: CreateActivitiesDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  /// Displays a dialog with the [CreateActivitiesDialog] content.
  onTapTwo(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: CreateActivitiesDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  /// Displays a dialog with the [CreateActivitiesDialog] content.
  onTapOrderSection(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: CreateActivitiesDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  /// Displays a dialog with the [CreateActivitiesOneDialog] content.
  onTapTxtText(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: CreateActivitiesOneDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}