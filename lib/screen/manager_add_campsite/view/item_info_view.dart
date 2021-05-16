import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';

class ItemInfoView extends StatefulWidget {
  /// thông tin cơ bản của khu cắm trại
  const ItemInfoView({
    Key key,
    @required this.title,
    this.hint,
    @required this.controller,
  }) : super(key: key);
  final String title;
  final String hint;
  final TextEditingController controller;

  @override
  _ItemInfoViewState createState() => _ItemInfoViewState();
}

class _ItemInfoViewState extends State<ItemInfoView> {
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
          
          hintText: widget.hint,
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
