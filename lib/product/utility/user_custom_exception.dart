class UserCustomException implements Exception {
  final String description;

  UserCustomException({required this.description});

  @override
  String toString() {
    return "Exception : $description";
  }
}
