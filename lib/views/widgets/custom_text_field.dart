import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants/color.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper.dart';
class CustomTextField extends StatelessWidget {
  final String titleText;
  final String? hintText;
  final String? errorText;
  final String? counterText;
  final int? maxLength;
  final int? maxLine;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormate;
  final bool? obsecure;
  final Color? textColor;
  final Color? hintTextColor;
  final Color? fillColor;
  final Color? staticColor;
  final bool? readOnly;
  final MouseCursor? mouse;
  final double? radius;
  final onSubmit;
  final Function()? onTap;
  final onChanged;
  final FocusNode? focusNode;
  final bool web;
  final bool required;
  final double? height;

  const CustomTextField({
    super.key,
    this.hintText,
    this.height,
    this.errorText,
    required this.controller,
    required this.inputType,
    required this.titleText,
    this.inputFormate,
    this.maxLength,
    this.staticColor,
    this.obsecure,
    this.suffixIcon,
    this.textColor,
    this.fillColor,
    this.readOnly,
    this.mouse,
    this.radius,
    this.onSubmit,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.maxLine,
    this.counterText,
    this.web = false,
    this.required = false,
    this.hintTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.smallSpace, bottom: AppSizes.smallSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleText.isNotEmpty)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText,
                  style: TextStyle(color: textColor ?? AppColors.darkGreyColor, fontSize: web ? AppSizes.fontSize20 : AppSizes.fontSize16,),
                ),
                if (required)
                  Text(
                    "*",
                    style: TextStyle(color: AppColors.redColor, fontSize: AppSizes.fontSize12,),
                  ),
              ],
            ),
          SizedBox(
            height: Sizes.size5,
          ),
          Container(
            height: height,
            child: TextField(
                focusNode: focusNode,
                onChanged: onChanged,
                controller: controller,
                maxLength: maxLength,
                maxLines: maxLine ?? 1,
                obscureText: obsecure ?? false,
                readOnly: readOnly ?? false,
                decoration: InputDecoration(
                    hoverColor: Colors.transparent,
                    // contentPadding: const EdgeInsets.only(
                    //     left: AppSizes.mediumSpace,
                    //     right: AppSizes.mediumSpace,
                    //     top: AppSizes.mediumSpace),

                    hintText: hintText,
                    filled: true,
                    fillColor: fillColor ?? AppColors.whiteColor,
                    counterText: counterText ?? '',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: staticColor ?? AppColors.unFocusInputBorderColor, width: 1.5),
                      borderRadius: BorderRadius.circular(radius ?? 10),
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: staticColor ?? AppColors.focusInputBorderColor, width: 1.5), borderRadius: BorderRadius.circular(radius ?? 10)),
                    suffixIcon: suffixIcon,
                    hintStyle: TextStyle(
                        overflow: TextOverflow.ellipsis, color: hintTextColor ?? AppColors.lightGrey, fontSize: web ? AppSizes.fontSize20 : AppSizes.fontSize15,)),
                inputFormatters: inputFormate ?? [NoLeadingSpaceFormatter()],
                mouseCursor: mouse,
                onSubmitted: onSubmit,
                onTap: onTap),
          ),
          if (errorText != null)
            Visibility(
              visible: errorText == '' ? false : true,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 5),
                child: Text(
                  errorText ?? "",
                  style: TextStyle(overflow: TextOverflow.ellipsis, color: AppColors.redColor, fontSize: AppSizes.fontSize14, ),
                  maxLines: 2,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
