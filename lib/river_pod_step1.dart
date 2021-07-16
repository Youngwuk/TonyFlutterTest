import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var textStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);

final welcomeProvider = Provider((ref) => 'Welcome to Riverpod');
final counterProvider = ChangeNotifierProvider((ref) => CounterNotifier());

class RiverPodStep1 extends ConsumerWidget {
  const RiverPodStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final welcomeString = watch(welcomeProvider);

    return MaterialApp(
      title: 'RiverPod Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: Text(welcomeString, style: textStyle),
        ),
      ),
    );
  }
}

class RiverPodStep2 extends StatelessWidget {
  const RiverPodStep2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RiverPod Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, watch, child) {
              final counterNotifier = watch(counterProvider);
              return Text('${counterNotifier.value}', style: textStyle);
            },
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () => _incrementCount(context),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  _incrementCount(BuildContext context) {
    context.read(counterProvider).incrementValue();
  }
}

class CounterNotifier extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void incrementValue() {
    _value++;
    notifyListeners();
  }

}
