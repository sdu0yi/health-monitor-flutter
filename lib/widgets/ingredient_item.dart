import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class IngredientItem extends StatelessWidget {
  const IngredientItem({
    Key? key,
     this.img,
     this.addFunction,
     this.name,
  }) : super(key: key);
  /// img url.
  final String? img;
  /// Callback function of onPressed().
  final VoidCallback? addFunction;
  /// The name of the ingredient.
  final String? name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: Card(
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 15.0,
            ),
            Image.network(
              img ?? 'https://www.sdu.edu.cn/images/logo.png',
              width: 90.0,
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(child: Text(name ?? 'Not Specified')),
            SizedBox(
              width: 60.0,
              child: ElevatedButton(
                onPressed: addFunction ?? (){},
                child: const Text("add"),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
