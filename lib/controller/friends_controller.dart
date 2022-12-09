import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/provider/general_provider.dart';
import 'package:saigai01/repository/friends_repository.dart';

import '../model/users_state.dart';

class FriendsController extends StateNotifier<List<UsersState>> {
  final Ref ref;
  FriendsController(this.ref) : super([]) {
    ref.read(friendsListRepositoryProvider).feachFriends().listen((data) {
      state = data.map((doc) => doc.data()).toList();
    });
  }

  Future<void> searchUser(String uid) async {
    final myUid = ref.read(authControllerProvider)!.uid;
    String msg = "";
    final myUsersState = ref.read(usersControllerProvider);
    final result =
        await ref.read(friendsListRepositoryProvider).searchUser(uid);
    if (result == null) {
      msg = "ユーザーが存在しないか無効なQRコードです。";
      shwoToast(msg);
      return;
    }
    if (result.friends.contains(myUid)) {
      msg = "既にフレンドに登録済みです";
      shwoToast(msg);
      return;
    }
    if (result.uid == uid) {
      List friendList = [];
      for (int i = 0; i < result.friends.length; i++) {
        friendList.add(result.friends[i]);
      }
      friendList.add(myUid);

      List myList = [];
      for (int i = 0; i < myUsersState!.friends.length; i++) {
        myList.add(myUsersState.friends[i]);
      }
      myList.add(uid);
      await ref.read(friendsListRepositoryProvider).makeFriend(
            result.uid,
            friendList,
            myList,
          );
      msg = "${result.name}さんとフレンドになりました。";
      shwoToast(msg);

      return;
    }
  }

  void shwoToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      textColor: const Color.fromARGB(255, 255, 255, 255),
      fontSize: 16.0,
    );
  }
}
