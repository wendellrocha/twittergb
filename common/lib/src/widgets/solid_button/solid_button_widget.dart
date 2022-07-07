import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SolidButtonWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? buttonColor;
  final Function callback;
  final bool showProgress;
  final FontWeight fontWeight;
  final double fontSize;
  final Color? fontColor;
  final double? height;
  final double? width;
  final TextAlign textAlign;
  final double? textScaleFactor;
  final bool showShadow;
  final bool useUpperCase;
  final double borderRadius;
  const SolidButtonWidget({
    Key? key,
    required this.title,
    this.color,
    this.buttonColor,
    required this.callback,
    this.showProgress = false,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 16,
    this.height,
    this.width,
    this.fontColor,
    this.textAlign = TextAlign.center,
    this.textScaleFactor = 1.0,
    this.showShadow = true,
    this.useUpperCase = true,
    this.borderRadius = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonColor ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(.2),
                  blurRadius: 5.0,
                  offset: const Offset(0.0, 5.0),
                ),
              ]
            : null,
      ),
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 55,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: buttonColor ?? Theme.of(context).primaryColor,
          ),
          primary: color ?? Theme.of(context).primaryColor,
          backgroundColor: buttonColor ?? Theme.of(context).primaryColor,
          minimumSize: const Size(88, 36),
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius,
              ),
            ),
          ),
        ),
        onPressed: !showProgress ? () => callback() : () {},
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeInBack,
          switchOutCurve: Curves.easeOutBack,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              alignment: Alignment.center,
              child: child,
            );
          },
          child: showProgress
              ? const CupertinoActivityIndicator()
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      useUpperCase ? title.toUpperCase() : title,
                      textAlign: textAlign,
                      textScaleFactor: textScaleFactor,
                      style: TextStyle(
                        color: fontColor ?? Colors.white,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
