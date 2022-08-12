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
    const Color transparentGrey=Color(0x7E080808);
    return FloatingActionButton(
      onPressed: pressedFunction,
      backgroundColor: transparentGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
      // child: Text(title ?? '确认'),
      child:const Image(image:AssetImage("icons/菜篮子.png"),width: 48,height: 48,),
    );
  }
}
