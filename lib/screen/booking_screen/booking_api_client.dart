import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookingApiClient {
  CollectionReference ref = FirebaseFirestore.instance.collection('booking');

  void createBooking({
    String email,
    String userName,
    String campName,
    Timestamp createDate,
    int people,
    int children,
    int price,
    String stay,
    String checkinDate,
    String checkinTime,
    String imageUrl,
  }) async {
    await ref.doc().set({
      'email': email,
      'user_name': userName,
      'camp_name': campName,
      'create_date': createDate,
      'people': people,
      'children': children ,
      'price': price,
      'stay': stay,
      'checkin_date': checkinDate,
      'checkin_ime': checkinTime,
      'image_url': imageUrl,
    }).then((value) {
      print("booking Added");

      Fluttertoast.showToast(
        msg: 'Đặt lịch thành công',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }).catchError(
      (error) => print("Failed to add booking: $error"),
    );
  }
}
