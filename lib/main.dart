import 'package:fast_search/bloc/index_bloc/index_bloc.dart';
import 'package:fast_search/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (ctx) => IndexBloc([]),
        child: HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
