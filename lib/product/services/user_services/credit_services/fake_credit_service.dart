import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_over/product/models/credit_model.dart';
import 'package:day_over/product/services/user_services/credit_services/base_credit_service.dart';

class FakeCreditService implements BaseCreditService {
  List<CreditModel> credits = [
    CreditModel(creditValue: 23, creditDate: Timestamp.now()),
    CreditModel(creditValue: 140, creditDate: Timestamp.now())
  ];

  @override
  Future<void> addCredit(String userId, int credit) async {
    credits.add(CreditModel(creditValue: credit, creditDate: Timestamp.now()));
  }

  @override
  Future<List<CreditModel>> getAll(String userId) async {
    return credits;
  }
}
