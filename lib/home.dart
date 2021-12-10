
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final counterProvider = StateProvider((ref) => 0);
class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.state).state++;
              },
            child: const Icon(Icons.add_circle_outlined),),
          ElevatedButton(
            onPressed: () {
              ref.read(counterProvider.state).state--;
            },
            child: const Icon(Icons.remove_circle_outlined),),
          Center(
            child:  Consumer(
              builder: (context, ref, _) {
                final count = ref.watch(counterProvider.state).state;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('count: $count'),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}