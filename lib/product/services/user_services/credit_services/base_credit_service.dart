import 'package:day_over/product/models/credit_model.dart';

abstract class BaseCreditService{
  Future<void> addCredit(String userId, int credit);
  Future<List<CreditModel>> getAll(String userId);
}