import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tony_flutter_test/RiverPodStateNotifier/application/state/user_state.dart';
import 'package:tony_flutter_test/RiverPodStateNotifier/utils/UserClient.dart';

class UserNotifier extends StateNotifier<UserState> {
  final UserClient _userClient;

  UserNotifier(this._userClient) : super(UserState());

  Future<void> getUserInfo(String userId) async {
    try {
      state = UserState.loading();
      final userInfo = await _userClient.fetchUserInfo(userId);
      state = UserState.loaded(userInfo!);
    } catch (e) {
      state = UserState.error('Error fetching user info, id:$userId');
    }
  }

}