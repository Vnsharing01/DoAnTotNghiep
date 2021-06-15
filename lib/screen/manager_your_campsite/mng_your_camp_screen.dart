import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/model/campsite_model.dart';
import 'package:yuru_camp/model/mng_camp_model.dart';
import 'package:yuru_camp/styles/color.dart';
import 'package:yuru_camp/styles/styles.dart';
import 'package:yuru_camp/views/btn_view.dart';

import 'views/item_info_addr_view.dart';
import 'views/item_info_content_view.dart';
import 'mng_your_camp_presenter.dart';

/// màn hình khi có khu cắm trại
class MngYourCampScreen extends StatefulWidget {
  const MngYourCampScreen({
    Key key,
    this.mngModel,
    this.campModel,
  }) : super(key: key);
  final MngCampModel mngModel;
  final CampsiteModel campModel;
  @override
  _MngYourCampScreenState createState() => _MngYourCampScreenState();
}

class _MngYourCampScreenState extends State<MngYourCampScreen>
    implements Contract {
  MngYourCampPresenter _presenter;

  @override
  void initState() {
    _presenter = MngYourCampPresenter(context, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.mngModel?.campName ?? '-----',
                      style: Styles.copyStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.mngModel?.mngName ?? '-----',
                      style: Styles.copyStyle(),
                    ),
                    Text(
                      widget.mngModel?.email ?? '-----',
                      style: Styles.copyStyle(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Khách đặt lịch  ',
                    style: Styles.copyStyle(
                      color: colorTvMain,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _presenter.nextUserBookList(
                        campName: widget.campModel.campName),
                    child: Text(
                      'Danh Sách ',
                      style: Styles.copyStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              decoration: buildBoxDecoration(),
            ),
            Container(
              padding: EdgeInsets.all(18),
              width: double.infinity,
              child: Text(
                'Thông tin khu cắm trại',
                style: Styles.copyStyle(
                  color: colorTvRed,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              decoration: buildBoxDecoration(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Ảnh',
                      style: Styles.copyStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 370,
                    child: widget.campModel?.images == null ||
                            widget.campModel.images.isEmpty
                        ? Text('không có ảnh')
                        : GridView.builder(
                            shrinkWrap: false,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: widget.campModel.images.length,
                            itemBuilder: (context, index) {
                              String image = widget.campModel?.images[index];
                              return Container(
                                margin: EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    image,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            },
                          ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Thông tin địa chỉ',
                      style: Styles.copyStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ItemInfoAddressView(
                    title: 'Địa Chỉ: ',
                    text: widget.campModel?.address ?? '-----',
                  ),
                  ItemInfoAddressView(
                    title: 'Hotline: ',
                    text: widget.campModel?.hotline.toString() ?? '-----',
                  ),
                  ItemInfoAddressView(
                    title: 'Email: ',
                    text: widget.campModel?.email ?? '-----',
                  ),
                  ItemInfoAddressView(
                    title: 'Fanpage: ',
                    text: widget.campModel?.fanpage ?? '-----',
                  ),
                  ItemInfoAddressView(
                    title: 'Website: ',
                    text: widget.campModel?.web ?? '-----',
                  ),
                ],
              ),
              decoration: buildBoxDecoration(),
            ),
            ItemInfoContentView(
              title: 'Giới thiệu',
              contentText: widget.campModel?.intro ?? '-----',
            ),
            ItemInfoContentView(
              title: 'Thông tin dịch vụ',
              contentText: widget.campModel?.service ?? '-----',
            ),
            Container(
              margin: EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BtnView(
                      press: () =>
                          _presenter.deleteCampsite(widget.campModel.campName),
                      text: 'xóa khu cắm trại',
                      color: colorDarkGray,
                      textColor: colorTvBlack,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: BtnView(
                      press: _presenter.nextEditCamp,
                      text: 'Chỉnh sửa nội dung',
                      color: colorPrimary,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      border: Border(
        top: BorderSide(color: colorDarkGray),
        bottom: BorderSide(color: colorDarkGray),
      ),
    );
  }

  @override
  void updateSate() {
    setState(() {});
  }
}
