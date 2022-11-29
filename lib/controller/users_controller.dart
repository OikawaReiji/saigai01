import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/repository/users_repository.dart';
import '../model/users_state.dart';

class UsersController extends StateNotifier<UsersState?> {
  final Ref ref;

  UsersController(this.ref) : super(UsersState()) {
    ref
        .read(usersRepositoryProvider)
        .feachUserData()
        .listen((data) => state = data!);
  }
}
