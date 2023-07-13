import 'package:cloud_firestore/cloud_firestore.dart';

class CreditModel {
  final int creditValue;
  final Timestamp creditDate;

  CreditModel({required this.creditValue, required this.creditDate});
}
