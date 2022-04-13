import 'package:counter_cubit/counter_bloc.dart';
import 'package:counter_cubit/counter_cubit.dart';
import 'package:counter_cubit/counter_observer.dart';
import 'package:counter_cubit/screens/counter_bloc_screen.dart';
import 'package:counter_cubit/screens/counter_cubit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
      ],
      child: GetMaterialApp(
        title: 'flutter_bloc v 6.x.x',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_bloc v 6.x.x'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Counter Using Cubit'),
              onPressed: () {
                Get.to(CounterCubitScreen());
              },
            ),
            ElevatedButton(
              child: Text('Counter Using Bloc'),
              onPressed: () {
                Get.to(CounterBlocScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
