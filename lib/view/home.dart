import 'package:flutter/material.dart';
import 'package:riverpod_test/view/counter.dart';
import 'package:riverpod_test/view/stream_counter.dart';
// import 'package:riverpod_test/view/counter.dart';


class HomePage extends StatelessWidget {
 const HomePage({Key? key}) : super(key: key);
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Home'),
     ),
     body: Center(
       child: ElevatedButton(
         child: const Text('Go to Counter Page'),
         onPressed: () {
           Navigator.of(context).push(
             MaterialPageRoute(
               builder: ((context) => const CounterPage()),
             ),
           );
         },
       ),
     ),
   );
 }
}