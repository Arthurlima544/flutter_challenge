class AppException implements Exception {
  const AppException(this.message, [this.stacktrace]);

  final String message;
  final StackTrace? stacktrace;

  @override
  String toString() {
    if (stacktrace != null) {
      return '$runtimeType: $message\nStacktrace: $stacktrace';
    }
    return '$runtimeType: $message';
  }
}
