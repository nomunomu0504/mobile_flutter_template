import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showAlertDialog({
  required BuildContext context,
  required String message,
  String? note,
  String? positiveButtonText,
  void Function()? onPressed,
}) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (builder) {
      return _DialogWidget(
        message: message,
        note: note,
        buttons: [
          _DialogButton(
            text: positiveButtonText ?? "閉じる",
            isDefaultAction: true,
            isDestructiveAction: false,
            onPressed: onPressed ??
                () {
                  Navigator.pop(context);
                },
          )
        ],
      );
    },
  );
}

Future<bool> showConfirmDialog({
  required BuildContext context,
  required String message,
  String? note,
  String? positiveButtonText,
  String? negativeButtonText,
  bool? isDestructive,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (builder) {
      return _DialogWidget(
        message: message,
        note: note,
        buttons: [
          _DialogButton(
            text: negativeButtonText ?? "キャンセル",
            isDefaultAction: false,
            isDestructiveAction: false,
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          _DialogButton(
            text: positiveButtonText ?? "OK",
            isDefaultAction: !(isDestructive ?? false),
            isDestructiveAction: isDestructive ?? false,
            onPressed: () {
              Navigator.pop(context, true);
            },
          )
        ],
      );
    },
  );
  return result ?? false;
}

void showProgressDialogForWrite({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Padding(
            padding: EdgeInsets.all(24.0),
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}

void hideProgressDialogForWrite({
  required BuildContext context,
}) {
  Navigator.pop(context);
}

void showProgressDialogForRead({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: const Color(0x88000000),
    builder: (BuildContext context) {
      return const Center(child: CircularProgressIndicator());
    },
  );
}

void hideProgressDialogForRead({
  required BuildContext context,
}) {
  Navigator.pop(context);
}

class _DialogButton {
  _DialogButton({
    required String text,
    required bool isDefaultAction,
    required bool isDestructiveAction,
    required void Function() onPressed,
  })  : _text = text,
        _isDefaultAction = isDefaultAction,
        _isDestructiveAction = isDestructiveAction,
        _onPressed = onPressed,
        super();

  final String _text;
  final bool _isDefaultAction;
  final bool _isDestructiveAction;
  final void Function() _onPressed;
}

class _DialogWidget extends StatelessWidget {
  const _DialogWidget({
    required String message,
    required String? note,
    required List<_DialogButton> buttons,
  })  : _message = message,
        _note = note,
        _buttons = buttons,
        super();

  final String _message;
  final String? _note;
  final List<_DialogButton> _buttons;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: Text(_message),
        content: _note != null ? Text(_note!) : null,
        actions: _buttons.map(
          (button) {
            return CupertinoDialogAction(
              onPressed: () {
                button._onPressed();
              },
              isDefaultAction: button._isDefaultAction,
              isDestructiveAction: button._isDestructiveAction,
              child: Text(button._text),
            );
          },
        ).toList(),
      );
    } else {
      return AlertDialog(
        title: Text(_message),
        content: _note != null ? Text(_note!) : null,
        actions: _buttons.map((button) {
          return TextButton(
            child: Text(button._text),
            onPressed: () {
              button._onPressed();
            },
          );
        }).toList(),
      );
    }
  }
}
