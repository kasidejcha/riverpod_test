import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/provider/provider.dart';

class StreamCounterPage extends ConsumerWidget {
  const StreamCounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch will make sure the widget is rebuild
    final AsyncValue<int> counter = ref.watch(counterProviderStream(5));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              counter.when(
                data: (int value) => value, 
                error: (Object e, _) => e, 
                loading: (){
                    return 0;
                  }
                ).toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}