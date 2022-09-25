import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar(
      {Key? key,
      this.tapFunction,
      this.editingCompleteFunction,
      this.submittedFunction})
      : super(key: key);

  final VoidCallback? tapFunction;
  final VoidCallback? editingCompleteFunction;
  final Function(String)? submittedFunction;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 5.0),
      child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 42.0),
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide.none),
                hintText: '搜索',
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                fillColor: Color.fromARGB(68, 211, 211, 211),
                filled: true),
            controller: _textEditingController,
            onTap: tapFunction,
            onEditingComplete: editingCompleteFunction,
            onSubmitted: submittedFunction,
          )),
    );
  }
}
