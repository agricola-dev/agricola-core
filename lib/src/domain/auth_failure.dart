class AuthFailure {
  final String message;
  final AuthFailureType type;

  const AuthFailure({
    required this.message,
    required this.type,
  });

  factory AuthFailure.fromException(Object e) {
    return AuthFailure(
      message: e.toString(),
      type: AuthFailureType.unknown,
    );
  }
}

enum AuthFailureType {
  userNotFound,
  wrongPassword,
  emailAlreadyInUse,
  invalidEmail,
  weakPassword,
  operationNotAllowed,
  userDisabled,
  tooManyRequests,
  networkError,
  accountExistsWithDifferentCredential,
  invalidCredential,
  unknown,
}
