import 'package:flutter/material.dart';

class EdtItemView extends StatelessWidget {
  const EdtItemView({
    Key key,
    @required this.title,
    this.hint,
    @required this.controller,
    this.textType,
  }) : super(key: key);
  final String title;
  final String hint;
  final TextEditingController controller;
  final TextInputType textType;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: controller,
            keyboardType: textType,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }
}
