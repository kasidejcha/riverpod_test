import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/provider/provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch will make sure the widget is rebuild
    final int counter = ref.watch(counterProvider);

    ref.listen(counterProvider, (previous, next) {
      if (next>=5){ // this if statement will only run when there is a change in the state
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Warning'),
              content:
                const Text('Counter dangerourly high. Consider resetting it.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK')
                )
              ]
            );
          }
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(counterProvider); // same as refresh but more optimized
              // ref.refresh(counterProvider);
              // ref.read(counterProvider.notifier).state = 0;
            },
            icon: const Icon(Icons.refresh),
          )
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read will not rebuild, this is just a one time read
          ref.read(counterProvider.notifier).state++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}