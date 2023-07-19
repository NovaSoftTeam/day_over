import 'package:day_over/product/models/credit_model.dart';
import 'package:day_over/product/repository/user_credit_repo.dart';
import 'package:day_over/product/utility/firebase_custom_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DataViewState { idle, busy }

class DataViewNotifier extends StateNotifier<DataViewState> {
  DataViewNotifier() : super(DataViewState.idle);

  final UserCreditRepo _userCreditRepo = UserCreditRepo();

  Future<List<CreditModel>> getAll(String userId) async {
    try {
      state = DataViewState.busy;
      return _userCreditRepo.getAll(userId);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    } finally {
      state = DataViewState.idle;
    }
  }
}

final dataViewProvider = StateNotifierProvider<DataViewNotifier, DataViewState>((ref) {
  return DataViewNotifier();
});