import 'dart:io';

class Co19 {
  static const languageDirName = "Language";
  late final TestDir root;
  late final TestDir language;

  Co19(String path) {
    Directory dir = Directory(path);
    if (!dir.existsSync()) {
      throw Exception("Directory '$path' does not exist");
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
  static final _filenamePattern = RegExp(r"_t[0-9]{2,3}.dart");
  final String path;
  late final String name;
  late final String comparableName;
  final List<TestDir> subDirs = [];
  final List<TestFile> tests = [];

  TestDir(Directory root) : path = resolvePath(root.path) {
    name = _entityName(path);
    comparableName = name.toLowerCase().replaceAll("-", "_");
    List<FileSystemEntity> entities = root.listSync();
    for (FileSystemEntity fse in entities) {
      if (_skip(fse)) {
        continue;
      }
      FileStat fs = fse.statSync();
      if (fs.type == FileSystemEntityType.directory) {
        subDirs.add(TestDir(Directory(fse.path)));
      } else if (fs.type == FileSystemEntityType.file) {
        if (!_filenamePattern.hasMatch(_entityName(fse.path))) {
          continue;
        }
        tests.add(TestFile(fse.path));
      }
    }
    subDirs.sort(
      (TestDir d1, TestDir d2) =>
          d1.comparableName.compareTo(d2.comparableName));
  }

  static String resolvePath(String relativePath) {
    String basePath = Directory.current.path;
    Uri baseUri = Uri.directory(basePath);
    Uri resolvedUri = baseUri.resolve(relativePath);
    return resolvedUri.toFilePath();
  }

  String _entityName(String p) =>
      p.substring(p.lastIndexOf(Platform.pathSeparator) + 1);

  bool _skip(FileSystemEntity fse) {
    // Skip directories like .git
    if (_entityName(fse.path).startsWith(RegExp(r"\.[a-zA-Z]+"))) {
      return true;
    }
    return false;
  }

  @override
  String toString() => comparableName;
}

class TestFile {
  final String path;

  TestFile(this.path);
}
