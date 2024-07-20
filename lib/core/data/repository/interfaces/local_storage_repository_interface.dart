import 'package:dartz/dartz.dart';
import 'package:poke_app/features/login/domain/entities/user.dart';

import '/core/shared/error_handle/failure.dart';

abstract class LocalStorageRepositoryInterface{

  Future<Either<Failure, bool>> makeLoginFake({required User user});

  Future<bool> setLocalUser({required User user});
}