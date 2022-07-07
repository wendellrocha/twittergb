import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderButtonWidget extends StatelessWidget {
  final String? title;
  final Color? color;
  final VoidCallback? callback;
  final bool? showProgress;
  final Color? borderColor;
  const BorderButtonWidget({
    Key? key,
    this.title,
    this.color,
    this.callback,
    this.showProgress = false,
    this.borderColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: color ?? Theme.of(context).primaryColor,
          minimumSize: const Size(88, 36),
          padding: const EdgeInsets.all(0),
          side: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        onPressed: !showProgress! ? callback! : () {},
        child: showProgress!
            ? const Center(
                child: CupertinoActivityIndicator(
                  animating: true,
                ),
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
