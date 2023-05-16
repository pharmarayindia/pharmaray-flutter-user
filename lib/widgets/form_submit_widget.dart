import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

/// A widget which will be used in the forms to allow user to submit the
/// details which were filled by the user.
///
/// [opacity] : The opacity of the widget to show that the widget is not enabled.
/// [disableColor] : The disable color of the widget.
/// [padding] : The padding around the content of the widget.
/// [onTap] : The tap event which will be triggered.
/// [text] : The text which will be shown.
/// [textStyle] : The style of the [text].
class FormSubmitWidget extends StatelessWidget {
  FormSubmitWidget({
    Key? key,
    this.opacity = 1,
    this.disableColor,
    this.startColor,
    this.endColor,
    this.buttonColor,
    this.buttonWidth,
    this.iconPath,
    this.iconColor,
    this.borderWidth,
    this.borderColor,
    this.padding,
    this.onTap,
    required this.text,
    this.textStyle,
    this.autoFocus = false,
    this.isIconShowLeft = false,
    this.buttonHeight,
    this.borderRadius,
  }) : super(key: key);

  final double opacity;
  final Color? disableColor;
  final Color? startColor;
  final Color? endColor;
  final Color? buttonColor;
  final String? iconPath;
  final Color? iconColor;
  final double? borderWidth;
  final Color? borderColor;
  final EdgeInsets? padding;
  final void Function()? onTap;
  final String? text;
  final TextStyle? textStyle;
  final bool autoFocus;
  final bool isIconShowLeft;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) => Opacity(
      opacity: opacity,
      child: Container(
        height: buttonHeight ?? Dimens.fourtyEight,
        width: buttonWidth ?? Get.width,
        decoration: BoxDecoration(
           boxShadow: [
              const BoxShadow(
                  color: Colors.black12, offset: Offset(0, 2), blurRadius: 2.0)
            ],
          border: Border.all(
              width: borderWidth ?? 0,
              color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(borderRadius ?? Dimens.ten),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(borderRadius ?? Dimens.ten),
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding!),
            //minimumSize: MaterialStateProperty.all(Size(width, 50)),
            backgroundColor: MaterialStateProperty.all(buttonColor),
          ),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  isIconShowLeft == false
                      ? Text(
                          text!,
                          style: textStyle,
                        )
                      : Container(),
                  if (iconPath != null &&
                      iconPath!.isNotEmpty &&
                      !isIconShowLeft)
                    SizedBox(width: Dimens.five),
                  if (iconPath != null && iconPath!.isNotEmpty)
                    Image(
                      width: Dimens.twenty,
                      height: Dimens.twenty,
                      color: iconColor ?? null,
                      image: AssetImage(iconPath!),
                    ),
                  if (isIconShowLeft)
                    SizedBox(width: Dimens.five),
                  if (isIconShowLeft)
                    Text(
                      text!,
                      style: textStyle,
                    ),
                ],
              ),
            ],
          ),
        ),
      ));
}
