import 'dart:convert' show jsonDecode;
import 'dart:io';
import 'package:spec_coverage/co19.dart';
import 'package:spec_coverage/config.dart';
import 'package:spec_coverage/spec.dart';

main(List<String> args) {
  Config config = Config.fromJson(readConfig());
  Spec spec = Spec.fromTxt(config.specPath);
  Co19 co19 = Co19(config.co19Dir);
  findSpecChapters(co19.language.subDirs, spec.chapters);
}

void findSpecChapters(List<TestDir> testDirs, List<Chapter> chapters) {
  for (TestDir td in testDirs) {
    bool found = false;
    for(Chapter ch in chapters) {
      if (td.name.toLowerCase() == ch.co19DirName.toLowerCase()) {
        print("Found spec for ${td.path}");
        findSpecChapters(td.subDirs, ch.subChapters);
        found = true;
        break;
      }
    }
    if (!found) {
      print("Not found spec for ${td.path}. Chapters are:");
      for (Chapter ch in chapters) {
        print(ch.co19DirName);
      }
    }
  }
}

Map<String, dynamic> readConfig() {
  final configFile = File('config/config.json');
  if (configFile.existsSync()) {
    final contents = configFile.readAsStringSync();
    return jsonDecode(contents);
  } else {
    throw Exception('Config file ${configFile.path} not found');
  }
}
