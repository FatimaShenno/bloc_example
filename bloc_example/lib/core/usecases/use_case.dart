import 'package:bloc_example/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class UseCase<T, Params> {
  Future<Either<Failure, T>> call({Params params});
}

class NoParams {}
