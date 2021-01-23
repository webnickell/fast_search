import 'package:fast_search/bloc/index_bloc/index_cubit.dart';
import 'package:fast_search/data/service/words_repository.dart';
import 'package:fast_search/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  final path = 'assets/words.txt';
  final wordsRepository = WordsRepository();

  runApp(FutureProvider(
    create: (_) => wordsRepository.getWords(path),
    child: BlocProvider(
      create: (ctx) => IndexCubit(ctx),
      child: MyApp(),
    ),
  ));
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
      home: HomePage(),
    );
  }
}
