import 'dart:ui';

import 'package:flutter/material.dart';

import '../border_button/border_button_widget.dart';
import '../solid_button/solid_button_widget.dart';

class OptionsModalWidget extends StatelessWidget {
  final String title;
  final String text;
  final String assetImage;
  final String buttonOkTitle;
  final Function buttonOkCallback;
  final String buttonCancelTitle;
  final Function buttonCancelCallback;
  final double height;
  final double width;
  final double? modalWidth;
  const OptionsModalWidget({
    Key? key,
    required this.title,
    required this.text,
    required this.buttonOkTitle,
    required this.buttonOkCallback,
    required this.buttonCancelTitle,
    required this.buttonCancelCallback,
    this.assetImage = 'assets/images/ops.png',
    this.height = 250,
    this.width = 250,
    this.modalWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        elevation: 4,
        backgroundColor: theme.backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: SizedBox(
          height: 500.0,
          width: modalWidth ?? MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 8),
                    Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: height,
                            width: width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(assetImage),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            color: theme.textTheme.bodyText1!.color,
                            iconSize: 32,
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyText1!.copyWith(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyText2!.copyWith(
                          fontSize: 18,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 0.5,
                        color: theme.dividerColor,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SolidButtonWidget(
                          useUpperCase: false,
                          title: buttonCancelTitle,
                          color: theme.primaryColor,
                          callback: () => buttonCancelCallback.call(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: BorderButtonWidget(
                          color: theme.primaryColor,
                          title: buttonOkTitle,
                          callback: () => buttonOkCallback.call(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
