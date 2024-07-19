import 'package:get_it/get_it.dart';
import 'package:poke_app/core/data/repository/implementation/local_storage_repository.dart';
import 'package:poke_app/features/login/domain/entities/user.dart';

Future<void> setUpUserTemporary() async {
  final user = User(username: 'eficacia', password: '123456');
  await GetIt.instance.get<LocalStorageRepository>().setLocalUser(user: user);
}
