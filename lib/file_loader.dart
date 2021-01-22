import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class FileLoader {
  Future<List<String>> loadWords(String path) async {
    final data = await rootBundle.loadString(path);

    final strs = data.split('\n');
    return strs;
  }
}
