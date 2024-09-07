class Failure {
  int code; // 200,201,303...500
  String message; //error, success
  Failure({
    required this.code,
    required this.message,
  });
}
