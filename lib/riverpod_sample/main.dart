import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RiverPod Provider',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter using Riverpod',
            style: TextStyle(
              fontWeight: FontWeight.w900,
            )),
      ),
      body: Center(
        child: Text(
          'value : $value',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => ref.read(counterStateProvider.state).state++,
              child: Icon(Icons.add),
            ),
            Expanded(child: Container()),
            FloatingActionButton(
              onPressed: () => ref.read(counterStateProvider.state).state--,
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
