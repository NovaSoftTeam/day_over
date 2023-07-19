import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_over/product/models/credit_model.dart';
import 'package:day_over/product/services/user_services/credit_services/base_credit_service.dart';
import 'package:day_over/product/utility/firebase_custom_exception.dart';

class FirebaseCreditService implements BaseCreditService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addCredit(String userId, int credit) async {
    try {
      CollectionReference credits = firestore.collection("your_credits");
      DateTime date = DateTime.now();
      await credits.doc(userId).set({
        'credits': FieldValue.arrayUnion([
          {
            'credit': credit,
            'creditDate': date,
          },
        ]),
      }, SetOptions(merge: true));
      throw UnimplementedError();
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }

  @override
  Future<List<CreditModel>> getAll(String userId) async {
    try {
      DocumentSnapshot yourCreditsDocSnapshot =
          await firestore.collection("your_credits").doc(userId).get();
      final dynamic data = yourCreditsDocSnapshot.data();
      final List<dynamic> taskDataList = data['credits'] ?? [];

      List<CreditModel> creditList = taskDataList.map((taskData) {
        return CreditModel(
          creditValue: taskData['credit'],
          creditDate: taskData['creditDate'],
        );
      }).toList();
      print(creditList[0].creditValue);
      return creditList;
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }
}
