import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tony_flutter_test/RiverPodStateNotifier/application/notifier/user_notifier.dart';
import 'package:tony_flutter_test/RiverPodStateNotifier/utils/UserClient.dart';

final userClientProvider = Provider<UserClient>((ref) => UserClient());

final userNotifierProvider = StateNotifierProvider(
    (ref) => UserNotifier(ref.watch(userClientProvider)),
);

final counterProvider = StateNotifierProvider((ref) => Counter());

class Counter extends StateNotifier<int> {
  Counter(): super(0);
  void increment() => state++;
}