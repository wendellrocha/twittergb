import 'dart:ui';

import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

bool _isShowing = false;
String? _text;
BuildContext? _dismissingContext;
bool _barrierDismissible = true;

class ProgressWidget {
  _Dialog? _dialog;

  ProgressWidget({required bool isDismissible, required String text}) {
    _barrierDismissible = isDismissible;
    _text = text;
  }

  bool isShowing() {
    return _isShowing;
  }

  Future<bool> hide() async {
    try {
      if (_isShowing) {
        _isShowing = false;
        Navigator.of(_dismissingContext!).pop();
        return Future.value(true);
      } else {
        debugPrint('ProgressDialog already dismissed');
        return Future.value(false);
      }
    } catch (e) {
      debugPrint('Seems there is an issue hiding dialog');
      return Future.value(false);
    }
  }

  Future<bool> show() async {
    try {
      if (!_isShowing) {
        _dialog = _Dialog();
        asuka.showDialog(
          barrierDismissible: _barrierDismissible,
          builder: (BuildContext context) {
            _dismissingContext = context;
            return WillPopScope(
              onWillPop: () async => _barrierDismissible,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Dialog(
                  backgroundColor: Theme.of(context).backgroundColor,
                  elevation: 4,
                  insetAnimationCurve: Curves.easeInOut,
                  insetAnimationDuration: const Duration(milliseconds: 100),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: _dialog,
                ),
              ),
            );
          },
        );
        await Future.delayed(const Duration(milliseconds: 200));
        debugPrint('ProgressDialog shown');
        _isShowing = true;
        return true;
      } else {
        debugPrint('ProgressDialog already shown/showing');
        return false;
      }
    } catch (e) {
      _isShowing = false;
      debugPrint('Exception while showing the dialog');
      debugPrint(e.toString());
      return false;
    }
  }
}

// ignore: must_be_immutable
class _Dialog extends StatefulWidget {
  final _DialogState _dialog = _DialogState();
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _dialog;
  }
}

class _DialogState extends State<_Dialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 18),
          const Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              _text!,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(width: 18),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _isShowing = false;
    super.dispose();
  }
}
