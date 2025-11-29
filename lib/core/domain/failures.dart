import "package:freezed_annotation/freezed_annotation.dart";

part "failures.freezed.dart";

@freezed
class Failure with _$Failure {
  const factory Failure.httpBadRequest() = HttpBadRequest;
  const factory Failure.httpUnauthorized() = HttpUnauthorized;
  const factory Failure.httpNotFound() = HttpNotFound;
  const factory Failure.httpServerError() = HttpServerError;
  const factory Failure.httpGeneralError([String? message]) = HttpGeneralError;
  const factory Failure.serialisationError() = SerialisationError;
  const factory Failure.generalGraphQLError([List<String>? messages]) =
      GeneralGraphQLError;
  const factory Failure.nullValueError() = NullValueError;
  const factory Failure.noResidenceError() = NoResidenceError;
  const factory Failure.exception(String? message) = FailureException;
  const factory Failure.authCancelledByUser() = AuthCancelledByUser;
}
