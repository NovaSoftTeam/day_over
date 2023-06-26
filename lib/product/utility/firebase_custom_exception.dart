class FirebaseCustomException implements Exception {
  final String description;

  FirebaseCustomException({required this.description});

  @override
  String toString() {
    return "Exception : $description";
  }
}
