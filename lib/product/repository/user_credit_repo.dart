import 'package:day_over/product/models/credit_model.dart';
import 'package:day_over/product/services/user_services/credit_services/base_credit_service.dart';
import 'package:day_over/product/services/user_services/credit_services/fake_credit_service.dart';
import 'package:day_over/product/services/user_services/credit_services/firebase_credit_service.dart';

enum AppMode { debug, release }

class UserCreditRepo implements BaseCreditService{

  AppMode appMode = AppMode.release;

  final FirebaseCreditService _creditService = FirebaseCreditService();
  final FakeCreditService _fakeService = FakeCreditService();

  @override
  Future<void> addCredit(String userId, int credit) async{
    if(appMode == AppMode.release){
      await _creditService.addCredit(userId, credit);
    }else{
     await _fakeService.addCredit(userId, credit);
    }
  }

  @override
  Future<List<CreditModel>> getAll(String userId) {
    throw UnimplementedError();
  }

}