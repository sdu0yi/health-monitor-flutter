import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    Key? key,
    this.img,
    this.addFunction,
    this.name,
    this.description,
  }) : super(key: key);

  /// img url.
  final String? img;

  /// Callback function of onPressed().
  final VoidCallback? addFunction;

  /// The name of the ingredient.
  final String? name;

  final String? description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
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
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? 'Not Specified',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(description ?? 'Not Specified')
                ],
              ),
            )),
            Container(
                width: 40.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amberAccent),
                      alignment: Alignment.center),
                  onPressed: addFunction,
                  child: const SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                )),
            const SizedBox(
              width: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
