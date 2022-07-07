import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../common.dart';

class WarnModalWidget extends StatelessWidget {
  final String title;
  final String text;
  final String buttonText;
  final String assetImage;
  final Function? buttonCallback;
  final double width;
  final double height;
  const WarnModalWidget({
    Key? key,
    required this.title,
    required this.text,
    this.buttonText = 'FECHAR',
    this.assetImage = 'assets/images/error.png',
    this.buttonCallback,
    this.width = 250,
    this.height = 250,
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
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Container(
          height: 500.0,
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: width,
                            width: height,
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
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyText1!.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyText2!.copyWith(
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SolidButtonWidget(
                title: buttonText,
                callback: () {
                  if (buttonCallback != null) {
                    buttonCallback?.call();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
