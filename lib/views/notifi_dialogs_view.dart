import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_item_view.dart';

class NotifiDialogView extends StatelessWidget {
  const NotifiDialogView({
    Key key,
    this.content,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Thông Báo'),
      content: Text(content),
      actions: [
        BtnItemView(
          press: () {
            Navigator.of(context).pop();
          },
          text: 'OK',
          color: colorPrimary,
        )
      ],
    );
  }
}
