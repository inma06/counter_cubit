import 'package:counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit'),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, counter) {
          return Center(
            child: Text(
              '$counter',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.add),
            onPressed: () {
              counterCubit.increment();
            },
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.remove),
            onPressed: () {
              counterCubit.decrement();
            },
          ),
        ],
      ),
    );
  }
}
