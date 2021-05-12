import 'package:yuru_camp/styles/color.dart';
import 'package:flutter/material.dart';

class CampsiteListScreen extends StatelessWidget {
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
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Hà Nội',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
              ),
            ),
            Divider(height: 5, color: Colors.grey),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return CampListItemView();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CampListItemView extends StatelessWidget {
  const CampListItemView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      margin: EdgeInsets.only(bottom: 20,left: 10,right: 10),
      height: 133,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage('assets/images/dongmo_banner.jpg'),
              width: 130,
              height: 125,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ABC Camp',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ' một địa điểm mới sắp mở cửa trong một thời gian không xa. Camping Sport Đồng Mô sở hữu cho mình 3,9 ha với địa hình lý tưởng với tổ hợp rừng, núi, hồ nước, không gian xanh mát, không khí trong lành rất thích hợp cho các hoạt động dã ngoại cắm trại, vui chơi, vận động, trải nghiệm, thử thách giới hạn của bản thân nhưng cũng hết sức thư giãn, xả stress hiệu quả.',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.bottomRight,
                    child: RichText(
                      text: TextSpan(
                        text: '100000',
                        children: [
                          TextSpan(
                            text: ' vnd/ng',
                            style: TextStyle(color: colorTv2, fontSize: 14),
                          ),
                        ],
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: colorDarkGray,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ]),
    );
  }
}
