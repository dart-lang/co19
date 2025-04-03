import 'dart:io';

import 'package:spec_coverage/spec_parser.dart';

class Spec {
  late final List<Chapter> chapters;

  Spec.fromTxt(String path) {
    File file = File(path);
    List<String> lines = file.readAsLinesSync();
    SpecParser sp = SpecParser();
    chapters = sp.parse(lines);
  }
}

class Chapter {
  ChapterNumber number;
  String header;
  late String co19DirName;
  List<Chapter> subChapters = [];
  List<String> lines = [];

  Chapter({required this.number, required this.header})
    : co19DirName = header.replaceAll(" ", "_");

  @override
  String toString() => "$number $header";
}

class ChapterNumber {
  final List<int> numbers;

  ChapterNumber(this.numbers);

  @override
  String toString() => numbers.join(".");
}
