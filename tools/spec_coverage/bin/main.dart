import 'dart:convert' show jsonDecode;
import 'dart:io';
import 'package:spec_coverage/co19.dart';
import 'package:spec_coverage/configuration.dart';
import 'package:spec_coverage/specification.dart';

main() {
  Configuration config = Configuration.fromJson(readConfig());
  Specification spec = Specification.fromTxt(config.specPath);
  Co19 co19 = Co19(config.co19Dir);
  findSpecChapters(co19.language.subDirs, spec.chapters);
}

void findSpecChapters(List<TestDir> testDirs, List<Chapter> chapters) {
  for (TestDir td in testDirs) {
    bool found = false;
    for(Chapter ch in chapters) {
      if (ch.comparableName.compareTo(td.comparableName) > 0) {
        break;
      } else if (td.comparableName == ch.comparableName) {
        print("Found spec for ${td.path}");
        findSpecChapters(td.subDirs, ch.subChapters);
        found = true;
        break;
      }
    }
    if (!found) {
      print("Not found spec for ${td.path}. Chapters are:");
      for (Chapter ch in chapters) {
        print(ch.comparableName);
      }
    }
  }
}

Map<String, dynamic> readConfig() {
  final configFile = File('configuration/configuration.json');
  if (configFile.existsSync()) {
    final contents = configFile.readAsStringSync();
    return jsonDecode(contents);
  } else {
    throw Exception('Config file ${configFile.path} not found');
  }
}
