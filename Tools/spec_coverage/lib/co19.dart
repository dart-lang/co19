import 'dart:io';

class Co19 {
  static const languageDirName = "Language";
  late final TestDir root;
  late final TestDir language;

  Co19(String path) {
    Directory dir = Directory(path);
    if (!dir.existsSync()) {
      throw Exception("Directory '$path' does not exists");
    }
    root = TestDir(dir);
    for (TestDir td in root.subDirs) {
      if (td.name == languageDirName) {
        language = td;
        break;
      }
    }
  }
}

class TestDir {
  final String path;
  final List<TestDir> subDirs = [];
  final List<TestFile> tests = [];

  TestDir(Directory root) : path = resolvePath(root.path) {
    List<FileSystemEntity> entities = root.listSync();
    for (FileSystemEntity fse in entities) {
      if (skip(fse)) {
        continue;
      }
      FileStat fs = fse.statSync();
      if (fs.type == FileSystemEntityType.directory) {
        subDirs.add(TestDir(Directory(fse.path)));
      } else if (fs.type == FileSystemEntityType.file) {
        tests.add(TestFile(fse.path));
      }
    }
  }

  static String resolvePath(String relativePath) {
    String basePath = Directory.current.path;
    Uri baseUri = Uri.directory(basePath);
    Uri resolvedUri = baseUri.resolve(relativePath);
    return resolvedUri.toFilePath();
  }

  String get name => _entityName(path);

  String _entityName(String p) =>
      p.substring(p.lastIndexOf(Platform.pathSeparator) + 1);

  bool skip(FileSystemEntity fse) {
    // Skip directories like .git
    if (_entityName(fse.path).startsWith(RegExp(r"\.[a-zA-Z]+"))) {
      return true;
    }
    return false;
  }
}

class TestFile {
  final String path;

  TestFile(this.path);
}
