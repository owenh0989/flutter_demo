import 'package:flutter/material.dart';
import 'package:lumiere_note_sp/presentation/components/paginate/button_arrow.dart';
import 'package:lumiere_note_sp/presentation/theme/colors.dart';

class PaginateButton extends StatelessWidget {
  const PaginateButton(
      {Key? key,
      required this.active,
      this.width,
      required this.buttonStyles,
      required this.page,
      required this.height,
      required this.color,
      required this.onTap})
      : super(key: key);

  final bool active;
  final double height;
  final double? width;
  final int page;
  final Color color;
  final Function(int number) onTap;
  final PaginateButtonArrowStyles buttonStyles;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: buttonStyles.getPaginateButtonBorderRadius,
      child: Container(
        padding: EdgeInsets.all(1),
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        child: Material(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: AppColors.grey,
              width: 1,
            ),
          ),
          color: active
              ? buttonStyles.getActiveBackgroundColor
              : buttonStyles.getBackgroundColor,
          child: InkWell(
            onTap: () {
              onTap(page);
            },
            child: Center(
              child: Text(
                "$page",
                style: active
                    ? buttonStyles.getActiveTextStyle
                    : buttonStyles.getTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
