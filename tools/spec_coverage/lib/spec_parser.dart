import 'specification.dart';

class SpecParser {
  static const pchar = "§";
  int chapterCounter1 = 0;
  int chapterCounter2 = 0;
  int chapterCounter3 = 0;

  List<Chapter> parse(List<String> lines) {
    return _parseLevel(null, lines, 1);
  }

  List<Chapter> _parseLevel(Chapter? ch, List<String> lines, int level) {
    final List<Chapter> parsed = [];
    final List<String> chLines = [];

    Pattern pattern = switch (level) {
      1 => RegExp("$pchar [a-zA-Z]{2,}"),
      2 => RegExp(" $pchar.$pchar [a-zA-Z]{2,}"),
      3 => RegExp("  $pchar.$pchar.$pchar [a-zA-Z]{2,}"),
      _ => throw "Wrong level number $level",
    };

    while (lines.isNotEmpty) {
      String line = lines.removeAt(0);
      if (line.startsWith(pattern)) {
        if (ch != null) {
          if (level < 3) {
            ch.subChapters = _parseLevel(ch, chLines, level + 1);
          }
          ch.lines = chLines;
          chLines.clear();
        }
        ChapterNumber cn = _getChapterNumber(line);
        int start = cn.numbers.length == 1 ? 2 : 2 * cn.numbers.length + 1;
        ch = Chapter(number: cn, header: line.substring(start).trim());
        parsed.add(ch);
      } else if (ch != null) {
        chLines.add(line);
      }
    }
    return parsed;
  }

  ChapterNumber _getChapterNumber(String line) {
    if (line.startsWith("  $pchar.$pchar.$pchar")) {
      return ChapterNumber([
        chapterCounter1,
        chapterCounter2,
        ++chapterCounter3,
      ]);
    }
    if (line.startsWith(" $pchar.$pchar")) {
      chapterCounter3 = 0;
      return ChapterNumber([chapterCounter1, ++chapterCounter2]);
    }
    chapterCounter2 = 0;
    chapterCounter3 = 0;
    return ChapterNumber([++chapterCounter1]);
  }
}
