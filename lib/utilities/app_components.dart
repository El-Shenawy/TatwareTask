import 'package:flutter/material.dart';
import 'package:task/utilities/app_colors.dart';
import 'package:task/utilities/app_strings.dart';
import 'package:task/utilities/size_config.dart';

import 'app_constants.dart';

Widget customText({
  required String text,
  required double fontSize,
  required FontWeight fontWeight,
  required Alignment alignment,
  required Color textColor,
}) {
  return Align(
    alignment: alignment,
    child: Text(
      text,
      textAlign: TextAlign.center,
      maxLines: 5,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        height: 1.2,
      ),
    ),
  );
}

Widget customElevatedButton(
    {required String text,
    required double fontSize,
    required FontWeight fontWeight,
    required Alignment alignment,
    required Color textColor,
    required Color backGroundColor,
    required void Function() onPressed,
    bool isUnderLined = false}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
        elevation: MaterialStateProperty.all(0.0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(backGroundColor),
        minimumSize: MaterialStateProperty.all(Size(
            SizeConfig.screenWidth * 0.1, SizeConfig.screenHeight * 0.06))),
    child: customText(
      text: text,
      fontSize: fontSize,
      fontWeight: fontWeight,
      alignment: alignment,
      textColor: textColor,
    ),
  );
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color? bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

List<BoxShadow> defaultBoxShadow({
  Color? shadowColor,
  double? blurRadius,
  double? spreadRadius,
  Offset offset = const Offset(0.0, 0.0),
}) {
  return [
    BoxShadow(
      color: shadowColor ?? shadowColorGlobal,
      blurRadius: blurRadius ?? 4.0,
      spreadRadius: spreadRadius ?? 1.0,
      offset: offset,
    )
  ];
}

Widget customOutLineBorderContainer(
    {required double height, required Widget child}) {
  return Container(
    // height: height,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(
        color: lightGray,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: child,
  );
}

Widget customTextField({
  required String uperText,
  required String hintText,
  required TextEditingController controller,
  Image? prefixIcon,
  Image? suffixIcon,
  bool? isError,
  TextInputType? inputType,
  bool? isReadOnly,
  bool? isObscure,
}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          uperText,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: colorGrayText,
          ),
        ),
      ),
      const SizedBox(
        height: 8.0,
      ),
      Container(
        height: 50,
        width: SizeConfig.screenWidth * 0.73,
        decoration: BoxDecoration(
            color: colorLightGray,
            borderRadius: BorderRadius.circular(8.0),
            border: (isError != null && isError == true)
                ? Border.all(color: Colors.redAccent, width: 1)
                : Border.all(color: Colors.transparent, width: 0)),
        child: TextFormField(
          keyboardType: inputType ?? TextInputType.name,
          obscureText: isObscure ?? false,
          controller: controller,
          readOnly: isReadOnly ?? false,
          decoration: InputDecoration(
            prefixIcon: Image.asset(
              lang,
              scale: 3,
            ),
            suffixIcon: Image.asset(
              voice,
              scale: 3,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            focusColor: colorPlaceHolder,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: colorPlaceHolder,
              fontSize: 16,
            ),
            border: InputBorder.none,
          ),
        ),
      )
    ],
  );
}
