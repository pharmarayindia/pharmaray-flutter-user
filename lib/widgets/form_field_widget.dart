import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

/// A form field widget which will handle form ui.
///
/// [focusNode] : FocusNode for the form field.
/// [autoFocus] : Allow auto focus for the form field if true.
/// [textEditingController] : Text editing controller for the form field
///                           to handle the text change and other stuff.
/// [isObscureText] : If true it will make the form text secure.
/// [obscureCharacter] : If [isObscureText] true this will be used for the
///                      character which will be shown.
/// [textCapitalization] : Type of text capitalization for the form field.
/// [isFilled] : If true the decoration colors will be filled.
/// [contentPadding] : Padding for the form field between the content and
///                    boundary of the form.
/// [fillColor] : The background color of the form field.
/// [hintText] : The hint text of the form field.
/// [hintStyle] : The hint style for the the form field.
/// [errorStyle] : The error style for the the form field.
/// [formBorder] : The border for the form field.
/// [errorText] : The error text of the form field.
/// [suffixIcon] : The suffix widget of the form field.
/// [prefixIcon] : The prefix widget of the form field.
/// [textInputAction] : The text input action for the form filed.
/// [textInputType] : The keyboard type of the form field.
/// [formStyle] : The style of the form field. This will be used for the style
///               of the content.
class FormFieldWidget extends StatelessWidget {
  FormFieldWidget({
    Key? key,
    this.focusNode,
    this.autoFocus = false,
    this.textEditingController,
    this.focusedBorder,
    this.isObscureText = false,
    this.obscureCharacter = ' ',
    this.textCapitalization = TextCapitalization.none,
    this.isFilled,
    this.contentPadding = EdgeInsets.zero,
    this.fillColor,
    this.hintText,
    this.hintStyle,
    this.errorStyle,
    this.formBorder,
    this.formEnableBorder,
    this.errorText,
    this.constraints,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    this.formStyle,
    this.onChange,
    this.inputFormatters,
    this.cursorColor,
    this.isReadOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.floatingLabelBehavior,
    this.maxLength,
    this.fieldHeight,
    this.fieldWidth,
    this.initialValue,
  }) : super(key: key);

  final FocusNode? focusNode;
  final bool autoFocus;
  final TextEditingController? textEditingController;
  final bool isObscureText;
  final String obscureCharacter;
  final TextCapitalization textCapitalization;
  final bool? isFilled;
  final int? maxLength;
  final EdgeInsets contentPadding;
  final Color? fillColor;
  final Color? cursorColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final OutlineInputBorder? formBorder;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? formEnableBorder;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final TextStyle? formStyle;
  final void Function(String value)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final bool isReadOnly;
  final Function()? onTap;
  final int? maxLines;
  final double? fieldHeight;
  final double? fieldWidth;
  final String? initialValue;
  final BoxConstraints? constraints;
  final FloatingLabelBehavior? floatingLabelBehavior;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: fieldHeight ?? Dimens.fourtyEight,
            width: fieldWidth ?? Get.width,
            child: TextFormField(
              maxLines: maxLines,
              key: const Key('text-form-field'),
              readOnly: isReadOnly,
              maxLength: maxLength,
              autofocus: autoFocus,
              cursorColor: cursorColor ?? AppColors.primaryColor,
              textAlignVertical: TextAlignVertical.center,
              focusNode: focusNode,
              initialValue: initialValue,
              controller: textEditingController,
              obscureText: isObscureText,
              obscuringCharacter: obscureCharacter,
              textCapitalization: textCapitalization,
              onTap: onTap,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                floatingLabelBehavior:
                    floatingLabelBehavior ?? FloatingLabelBehavior.always,
                filled: true,
                counterText: '',
                contentPadding: contentPadding,
                fillColor: fillColor ?? Colors.white,
                suffixIconConstraints:constraints?? BoxConstraints(
                    minHeight: Dimens.thirty, minWidth: Dimens.thirty),
                border: formBorder ??
                    UnderlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.ten),
                      ),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                labelText: hintText,
                labelStyle: hintStyle,
                enabledBorder: formEnableBorder ??
                    UnderlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.ten),
                      ),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                focusedBorder: focusedBorder ??
                    UnderlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.ten),
                      ),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                errorBorder: formEnableBorder ??
                    UnderlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.ten),
                      ),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                focusedErrorBorder: formBorder ??
                    UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimens.ten),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                //errorText: errorText,
                errorStyle: errorStyle,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
              ),
              onChanged: onChange,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              style: formStyle,
            ),
          ),
          if (errorText != null && errorText!.isNotEmpty) Dimens.boxHeight3,
          if (errorText != null && errorText!.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.warning_rounded,
                    color: AppColors.textFieldErrorColor, size: 20),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    errorText!.toString(),
                    maxLines: 10,
                    style: errorStyle,
                  ),
                ),
              ],
            ),
        ],
      );
}
