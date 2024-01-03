class ServerException<T> implements Exception {
  T? erorr;
  ServerException({this.erorr});
}

sealed class Result<S, E> {
  const Result();
}

final class Success<S, E> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class AppError<S, E> extends Result<S, E> {
  const AppError(this.error);
  final E error;
}

final class Failure<S, E> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}

// sealed class Result<T> {
//   const Result();
// }

// //class for success responses
// final class Success<T> extends Result<T> {
//   const Success(this.value);
//   //we are going to receive a dynamic data, most cases a json data.
//   final T value;
// }

// //class for failure or exception responses
// final class Failure<T> extends Result<T> {
//   const Failure(this.exception);
//   final Exception exception;
// }
