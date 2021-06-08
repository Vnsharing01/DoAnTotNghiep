import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/screen/campsite_list/campsite_list_presenter.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/views/btn_item_view.dart';

class CampsiteListScreen extends StatefulWidget {
  @override
  _CampsiteListScreenState createState() => _CampsiteListScreenState();
}

class _CampsiteListScreenState extends State<CampsiteListScreen>
    implements Contract {
  CampsiteListPresenter _presenter;

  @override
  void initState() {
    _presenter = CampsiteListPresenter(context, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Image.asset('assets/icons/ic_back_black.png'),
        ),
        title: Text('Danh sách khu cắm trại'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: _presenter.hideKeyBoard,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: TextFormField(
                          controller: _presenter.areaController,
                          decoration: InputDecoration(
                            hintText: 'Hà Nội',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: BtnItemView(
                          press: () {
                            _presenter.searchArea(context);
                          },
                          text: 'Tìm',
                          color: colorPrimary,
                          margin: EdgeInsets.only(left: 10),
                        ),
                      ),
                    ],
                  )),
              Divider(height: 5, color: Colors.grey),
              Expanded(
                flex: 8,
                child: _presenter.campsiteAll(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void updateSate() {
    setState(() {});
  }
}
