import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';

class LoginSignupTxtFView extends StatefulWidget {
  const LoginSignupTxtFView({
    Key key,
    @required this.controller,
    @required this.hintText,
    this.icon,
    this.typePassword = false,
    this.showPass,
    this.validator,
    this.textInputAction,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;

  final String hintText;
  final Icon icon;
  final bool typePassword;
  final Widget showPass;
  final FormFieldValidator<String> validator;

  final TextInputAction textInputAction;
  final TextInputType keyboardType;

  @override
  _LoginSignupTxtFViewState createState() => _LoginSignupTxtFViewState();
}

class _LoginSignupTxtFViewState extends State<LoginSignupTxtFView> {
  String _msgError;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            controller: widget.controller ?? _controller,
            textDirection: TextDirection.ltr,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 14),
              prefixIcon: widget.icon,
              border: InputBorder.none,
              suffixIcon: widget.showPass ?? null,
            ),
            validator: widget.validator,
            maxLines: 1,
            obscureText: widget.typePassword,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction ?? TextInputAction.next,
          ),
        ),
        if (_msgError != null) 
          Text(
            _msgError,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: colorRed),
          ),
      ],
    );
  }

  // cop code cty c???n xem l???i ????? hi???u
  bool checkValidate() {
    if (widget.validator != null) {
      setState(() {
        _msgError =
            widget.validator(widget.controller?.text ?? _controller.text);
      });
    }
    return _msgError == null;
  }
}
