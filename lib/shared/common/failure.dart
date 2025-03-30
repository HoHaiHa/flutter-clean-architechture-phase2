import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.apiFailure(
      int? httpCode, String? code, String? message) = ApiFailure;
  const factory Failure.validateFailure(dynamic data) = ValidateFailure;
  const factory Failure.noInternetFailure() = NoInternetFailure;
  const factory Failure.connectionTimeoutFailure() = ConnectionTimeoutFailure;
  const factory Failure.unknowFailure() = UnknowFailure;
}
