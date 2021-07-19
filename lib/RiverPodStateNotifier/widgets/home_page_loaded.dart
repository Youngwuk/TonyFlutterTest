import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tony_flutter_test/RiverPodStateNotifier/model/user.dart';
import 'package:tony_flutter_test/RiverPodStateNotifier/providers.dart';
import 'package:tony_flutter_test/RiverPodStateNotifier/widgets/styled_text.dart';

class HomePageLoaded extends StatelessWidget {
  final User user;
  final TextEditingController _userIdController = TextEditingController();

  HomePageLoaded({required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(user.data.avatar),
            StyledText('NAME: ${user.data.firstName} ${user.data.lastName}'),
            StyledText('EMAIL: ${user.data.email}'),
            StyledText('ID: ${user.data.id}'),
            TextField(
              controller: _userIdController,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                context
                    .read(userNotifierProvider)
                    .getUserInfo(_userIdController.text);
              },
              child: Text('Get user info'),
            ),
          ],
        ),
      ),
    );
  }
}
