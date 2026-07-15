import 'dart:io';

import 'package:spec_coverage/spec_parser.dart';

class Specification {
  final List<Chapter> chapters = [];

  Specification.fromTxt(String path) {
    File file = File(path);
    List<String> lines = file.readAsLinesSync();
    SpecParser sp = SpecParser();
    chapters.addAll(sp.parse(lines));
    chapters.sort(
      (Chapter ch1, Chapter ch2) =>
          ch1.comparableName.compareTo(ch2.comparableName),
    );
  }
}

class Chapter {
  final ChapterNumber number;
  final String header;
  final String comparableName;
  final List<Chapter> _subChapters = [];
  final List<String> lines = [];

  Chapter({required this.number, required this.header})
    : comparableName =
          header.replaceAll(" ", "_").replaceAll("-", "_").toLowerCase();

  List<Chapter> get subChapters => _subChapters;

  void set subChapters(List<Chapter> val) {
    _subChapters.addAll(val);
    _subChapters.sort(
          (Chapter ch1, Chapter ch2) =>
          ch1.comparableName.compareTo(ch2.comparableName));
  }

  @override
  String toString() => "$number $header";
}

class ChapterNumber {
  final List<int> numbers;

  ChapterNumber(this.numbers);

  @override
  String toString() => numbers.join(".");
}
