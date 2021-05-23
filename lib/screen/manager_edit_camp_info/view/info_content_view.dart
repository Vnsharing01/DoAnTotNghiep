import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';

class InfoContentView extends StatefulWidget {
  /// nhập thông tin giới thiệu và dịch vụ khu cắm trại
  const InfoContentView({
    Key key,
    @required this.title,
    @required this.controller,
    this.inputAction,
  }) : super(key: key);
  final String title;
  final TextEditingController controller;
  final TextInputAction inputAction;

  @override
  _InfoContentViewState createState() => _InfoContentViewState();
}

class _InfoContentViewState extends State<InfoContentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextFormField(
            minLines: 7,
            maxLines: 7,
            controller: widget.controller,
            textInputAction: widget.inputAction ?? TextInputAction.next,
            decoration: InputDecoration(
              filled: true,
              fillColor: colorWhite,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorDarkGray),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorDarkGray),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
