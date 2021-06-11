import 'package:flutter/material.dart';

class RadioItemView extends StatelessWidget {
  const RadioItemView({
    Key key,
    this.title,
    @required this.value,
    @required this.grpVal,
    @required this.onChanged,
  }) : super(key: key);
  final String title;
  final int value;
  final int grpVal;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: RadioListTile(
        title: Text(title),
        value: value,
        groupValue: grpVal,
        onChanged: onChanged,
      ),
    );
  }
}
