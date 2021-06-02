import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';

class EdtInfoView extends StatefulWidget {
  /// thông tin cơ bản của khu cắm trại , user
  const EdtInfoView({
    Key key,
    @required this.title,
    @required this.controller,
    this.enabled,
  }) : super(key: key);
  final String title;

  final TextEditingController controller;
  final bool enabled;

  @override
  _EdtInfoViewState createState() => _EdtInfoViewState();
}

class _EdtInfoViewState extends State<EdtInfoView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        enabled: widget.enabled ?? true,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsetsDirectional.only(top: 12, start: 8, end: 8),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(),
          ),
          contentPadding: EdgeInsets.only(right: 8),
          fillColor: colorWhite,
          filled: true,
        ),
      ),
    );
  }
}
