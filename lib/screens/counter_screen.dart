import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title:
        Center(
            child: Text("Counter App")
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(50),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Text(
                  counter.toString(),
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          ref.read(counterProvider.notifier).state++;
                        },
                        child: Icon(Icons.add)
                    ),
                    SizedBox(width: 30,),
                    ElevatedButton(
                        onPressed: (){
                          ref.read(counterProvider.notifier).state--;
                        },
                        child: Icon(Icons.minimize)
                    ),
                    SizedBox(width: 30,),
                    ElevatedButton(
                        onPressed: (){
                          ref.read(counterProvider.notifier).state = 0;
                        },
                        child: Icon(Icons.restart_alt)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
