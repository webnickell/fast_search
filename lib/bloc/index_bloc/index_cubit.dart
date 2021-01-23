import 'package:collection/collection.dart';
import 'package:fast_search/data/model/words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';

class IndexCubit extends Cubit<int> {
  final BuildContext context;
  IndexCubit(this.context) : super(0);

  void search(String word) {
    if (word.isEmpty) {
      emit(0);
      return;
    }
    final words = Provider.of<Words>(context, listen: false);

    if (words == null) return;

    final i = binarySearch(
      words.words,
      word,
      compare: (String a, String b) {
        final minLen = math.min(a.length, b.length);
        final lA = a.substring(0, minLen).toLowerCase();
        final lB = b.substring(0, minLen).toLowerCase();
        return lA.compareTo(lB);
      },
    );

    emit(i);
  }
}
