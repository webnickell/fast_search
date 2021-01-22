import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexBloc extends Cubit<int> {
  final List<String> words;
  IndexBloc(this.words) : super(0);

  void search(String word) {
    final i = binarySearch(
      words,
      word,
      compare: (String a, String b) => a.compareTo(b),
    );

    emit(i);
  }
}
