import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';

class InfoAddressView extends StatefulWidget {
  /// thông tin cơ bản của khu cắm trại
  const InfoAddressView({
    Key key,
    @required this.title,
    @required this.controller,
  }) : super(key: key);
  final String title;

  final TextEditingController controller;

  @override
  _InfoAddressViewState createState() => _InfoAddressViewState();
}

class _InfoAddressViewState extends State<InfoAddressView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: widget.controller,
        textInputAction: TextInputAction.next,
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
