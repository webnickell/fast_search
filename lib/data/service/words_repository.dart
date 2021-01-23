import 'dart:io';
import 'package:fast_search/data/model/words.dart';
import 'package:flutter/services.dart' show rootBundle;

class WordsRepository {
  Future<Words> getWords(String path) async {
    final data = await rootBundle.loadString(path);

    final strs = data.split('\n');
    return Words(strs);
  }
}
