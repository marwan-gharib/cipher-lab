import '../exceptions/exceptions.dart';
import '../failures/cache_failure.dart';
import '../failures/failure.dart';
import '../failures/unknown_failure.dart';

class ErrorMapper {
  const ErrorMapper._();

  static Failure mapExceptionToFailure(AppException e) {
    return switch (e) {
      CacheException() => CacheFailure(),
      _ => UnknownFailure(),
    };
  }
}
