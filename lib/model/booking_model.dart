import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  BookingModel({
    this.email,
    this.userName,
    this.campName,
    this.createDate,
    this.people,
    this.children,
    this.price,
    this.stay,
    this.checkinDate,
    this.checkinTime,
    this.imageUrl, 
  });

  final String email;
  final String userName;
  final String campName;
  final Timestamp createDate;
  final int people;
  final int children;
  final int price;
  final String stay;
  final String checkinDate;
  final String checkinTime;
  final String imageUrl;
}
