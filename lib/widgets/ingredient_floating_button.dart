import 'package:flutter/material.dart';

class IngredientFloatingButton extends StatelessWidget {
  const IngredientFloatingButton(
      {Key? key, required this.pressedFunction, this.title})
      : super(key: key);

  /// OnPressed callback。
  final VoidCallback pressedFunction;
  /// Button's text.
  final String? title;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: pressedFunction,
      child: Text(title ?? '确认'),
    );
  }
}
