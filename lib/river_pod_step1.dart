import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var textStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);

final welcomeProvider = Provider((ref) => 'Welcome to Riverpod');


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

final counterProvider = ChangeNotifierProvider((ref) => CounterNotifier());

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

class FakeWeatherClient {
  Future<int> get(String cityName) async {
    await Future.delayed(Duration(seconds: 2));
    return cityName == 'Texas' ? 18 : 21;
  }
}

final fakeWeatherClientProvider = Provider((ref) => FakeWeatherClient());

final responseProvider = FutureProvider<int>((ref) async {
  final weatherClient = ref.read(fakeWeatherClientProvider);
  return weatherClient.get('Texus');
});

final responseProvider2 = FutureProvider.autoDispose.family<int, String>((ref, cityName) async {
  final weatherClient = ref.read(fakeWeatherClientProvider);
  return weatherClient.get(cityName);
});

class RiverPodStep3 extends StatelessWidget {
  const RiverPodStep3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, watch, child) {
                final responseValue = watch(responseProvider);
                return responseValue.map(
                  data: (weather) => Text('${weather.value}', style: textStyle),
                  loading: (_) => CircularProgressIndicator(),
                  error: (message) => Text('${message.error}'),);
              },
            )
          ],
        )
      ),
    );
  }
}
