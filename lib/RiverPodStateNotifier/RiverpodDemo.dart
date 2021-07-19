import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tony_flutter_test/RiverPodStateNotifier/providers.dart';

import 'widgets/home_page_error.dart';
import 'widgets/home_page_initial.dart';
import 'widgets/home_page_loaded.dart';
import 'widgets/home_page_loading.dart';

class RiverpodDemo extends StatelessWidget {
  const RiverpodDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod StateNotifier',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: HomePage(),
    );

  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
          final state = watch(userNotifierProvider.notifier).state;

          return state.when(
            () => HomePageInitial(),
            loading: () => HomePageLoading(),
            loaded: (userInfo) => HomePageLoaded(user: userInfo),
            error: (message) => HomePageError(message: message),
          );
        },
      ),
    );
  }
}


