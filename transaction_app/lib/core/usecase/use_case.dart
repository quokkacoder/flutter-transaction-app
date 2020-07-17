import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:transaction_app/core/errors/failures.dart';

abstract class UseCaseEither <Type, Params>{
  Future<Either<Failures, Type>> call(Params params);
}

abstract class UseCaseNormal <Type, Params>{
  Future<Type> call(Params params);
}

class NoParam extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

