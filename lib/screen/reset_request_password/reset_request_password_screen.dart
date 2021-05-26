import 'package:flutter/material.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_view.dart';

class RequestPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        centerTitle: true,
        title: Text('cấp lại mật khẩu'),
        leading: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Image.asset('assets/icons/ic_back_black.png'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Nhập Email của bạn ở bên dưới để gửi yêu cầu đặt lại mật khẩu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: colorTvMain,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: colorTvWhite),
                  ),
                ],
              ),
            ),
            BtnView(
              press: () {},
              text: 'Gửi yêu cầu',
              color: colorPrimary,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            ),
          ],
        ),
      ),
    );
  }
}
