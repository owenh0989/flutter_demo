import 'package:flutter/material.dart';
import 'package:lumiere_note_sp/gen/fonts.gen.dart';
import 'package:lumiere_note_sp/presentation/theme/colors.dart';
import 'package:lumiere_note_sp/utils/debounce_click_action.dart';

class FlatButtonComponent extends StatelessWidget {
  const FlatButtonComponent({
    Key? key,
    required this.title,
    required this.onPressed,
    this.enabled = true,
    this.unFocusInput = false,
    this.borderRadius,
    this.color,
    this.width,
    this.height,
    this.textColor,
    this.elevation,
    this.icon,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.isTextFlexible = false,
  }) : super(key: key);

  final String title;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool unFocusInput;
  final double? borderRadius;
  final Color? color;
  final Color? textColor;
  final double? elevation;
  final Widget? icon;
  final EdgeInsets? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool isTextFlexible;

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(title,
        style: TextStyle(
            fontFamily: FontFamily.sFProTextRegular,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
            color: textColor ?? (enabled ? AppColors.white : AppColors.white)));

    if (isTextFlexible) {
      textWidget = Flexible(child: textWidget);
    }

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: MaterialButton(
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        color: color ?? AppColors.colorNavy,
        disabledTextColor: AppColors.disableText,
        disabledColor: AppColors.bgDisable,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
        ),
        onPressed: enabled
            ? () {
                if (DebounceClickAction.isMultiClick()) {
                  return;
                }

                if (enabled && onPressed != null) {
                  if (unFocusInput) {
                    _unFocus(context);
                    Future.microtask(() {
                      return FocusScope.of(context)
                          .requestFocus(new FocusNode());
                    });
                  }
                  onPressed!();
                }
              }
            : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? SizedBox.shrink(),
            textWidget,
          ],
        ),
      ),
    );
  }

  void _unFocus(BuildContext context) =>
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}
