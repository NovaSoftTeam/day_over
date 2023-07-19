import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_over/product/models/current_user_model.dart';
import 'package:day_over/product/models/obez_model.dart';

class DatabaseService {
  //collection reference
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference obezCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference creditCollection =
      FirebaseFirestore.instance.collection('activeCredit');
  Future updateUserData(
    String ad,
    String boy,
    String cinsiyet,
    String kilo,
    String soyad,
    String yas,
  ) async {
    return await obezCollection.doc(uid).set({
      'ad': ad,
      'boy': boy,
      'cinsiyet': cinsiyet,
      'kilo': kilo,
      'soyad': soyad,
      'yas': yas,
    });
  }

  Future updateCreditData(int addedCredit) async {
    final activeCredit = await creditCollection
        .doc(uid)
        .get()
        .then((value) => value.get('money'));
    return await creditCollection.doc(uid).set({
      'money': activeCredit + addedCredit,
    });
  }

  //obez list from snapshot
  List<Obez> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Obez(
        ad: doc.get('ad') ?? '',
        boy: doc.get('boy') ?? '',
        cinsiyet: doc.get('cinsiyet') ?? '',
        kilo: doc.get('kilo') ?? '',
        soyad: doc.get('soyad') ?? '',
        yas: doc.get('yas') ?? '',
      );
    }).toList();
  }

  //userData from snapshot
  CurrenUserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return CurrenUserData(
      userId: uid,
      ad: snapshot['ad'],
      boy: snapshot['boy'],
      cinsiyet: snapshot['cinsiyet'],
      kilo: snapshot['kilo'],
      soyad: snapshot['soyad'],
      yas: snapshot['yas'],
    );
  }

  //get obez stream
  Stream<List<Obez>> get brews {
    return obezCollection.snapshots().map(_brewListFromSnapshot);
  }

  // get currentUser doc stream
  Stream<CurrenUserData> get userData {
    return obezCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
