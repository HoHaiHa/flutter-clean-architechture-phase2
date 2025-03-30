import 'failure.dart';

class Result<T> {
  Result.completed(this.data) : success = true;

  Result.failure(this.failure) : success = false;
  T? data;
  Failure? failure;
  bool success;
}
