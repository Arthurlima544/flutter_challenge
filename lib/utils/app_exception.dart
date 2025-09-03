class AppException implements Exception {
  final String message;
  final StackTrace? stacktrace;

  const AppException(this.message, [this.stacktrace]);

  @override
  String toString() {
    if (stacktrace != null) {
      return "$runtimeType: $message\nStacktrace: $stacktrace";
    }
    return "$runtimeType: $message";
  }
}
