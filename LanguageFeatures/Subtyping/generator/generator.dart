// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Generator for subtyping tests. Usage:
/// dart generator.dart
/// This call regenerates ../dynamic/generated and ../static/generated tests
///
/// Writing tests for the generator
///
/// Generator takes test types defined in ../test_types and for each test type
/// creates tests combining test cases defined in ../dynamic/test_cases and
/// ../static/test_cases
///
/// Each test case tests that type @T0 is subtype of type @T1. Each test type
/// defines actual T0 and T1 and instances of these types with names t0Instance
/// and t1Instance. In the end of the file specifies substitution, for example:
///
/// class T0 {}
/// T0 t0Instance = new T0();
/// dynamic t1Instance = 3.14;
/// //# @T0 = T0
/// //# @T1 = dynamic
///
/// - If test case or test type is negative, then its name must contain "_fail_"

import "dart:io";

const DYNAMIC_TESTS_DIR = "dynamic";
const STATIC_TESTS_DIR = "static";
const TEST_CASES_DIR = "test_cases";
const TEST_TYPES_DIR = "test_types";
const OUTPUT_DIR = "generated";

const IMPORT_COMMON = "import '../../utils/common.dart';";
const IMPORT_EXPECT = "import '../../../../Utils/expect.dart';";

const String META_PREFIX = "//#";

main() {
  // Generate dynamic tests
  // First generate tests for common test types
  Directory testCasesDir = new Directory(".." +
      Platform.pathSeparator +
      DYNAMIC_TESTS_DIR +
      Platform.pathSeparator +
      TEST_CASES_DIR);
  Directory testTypesDir =
      new Directory(".." + Platform.pathSeparator + TEST_TYPES_DIR);
  Directory outputDir = new Directory(".." +
      Platform.pathSeparator +
      DYNAMIC_TESTS_DIR +
      Platform.pathSeparator +
      OUTPUT_DIR);
  generateTests(testCasesDir, testTypesDir, outputDir, "dynamic");

  // Now generate tests for dynamic only test types
  testTypesDir = new Directory(".." +
      Platform.pathSeparator +
      DYNAMIC_TESTS_DIR +
      Platform.pathSeparator +
      TEST_TYPES_DIR);
  generateTests(testCasesDir, testTypesDir, outputDir, "dynamic", clear: false);

  // Generate static tests
  // First generate tests for common test types
  testCasesDir = new Directory(".." +
      Platform.pathSeparator +
      STATIC_TESTS_DIR +
      Platform.pathSeparator +
      TEST_CASES_DIR);
  testTypesDir = new Directory(".." + Platform.pathSeparator + TEST_TYPES_DIR);
  outputDir = new Directory(".." +
      Platform.pathSeparator +
      STATIC_TESTS_DIR +
      Platform.pathSeparator +
      OUTPUT_DIR);
  generateTests(testCasesDir, testTypesDir, outputDir, "static");

  // Now generate tests for static only test types
  testTypesDir = new Directory(".." +
      Platform.pathSeparator +
      STATIC_TESTS_DIR +
      Platform.pathSeparator +
      TEST_TYPES_DIR);
  generateTests(testCasesDir, testTypesDir, outputDir, "static", clear: false);
}

void generateTests(Directory testCasesDir, Directory testTypesDir,
    Directory outputDir, String testsType,
    {bool clear = true}) {
  // First, clear output directory
  if (clear) {
    List<FileSystemEntity> existing = outputDir.listSync();
    for (int i = 0; i < existing.length; i++) {
      existing[i].deleteSync();
    }
  }

  // Generate tests
  List<FileSystemEntity> testCases = testCasesDir.listSync();
  List<FileSystemEntity> testTypes = [];
  if (testTypesDir.existsSync()) {
    testTypes = testTypesDir.listSync();
  }
  int generatedCount = 0;
  for (int i = 0; i < testTypes.length; i++) {
    File testType = testTypes[i] as File;
    for (int j = 0; j < testCases.length; j++) {
      File testCase = testCases[j] as File;
      Test test = Test(testType, testCase, outputDir, testsType == "dynamic");
      if (test.isTestTypeFailing) {
        if (!test.isTestCaseFailing) {
          continue;
        }
      } else {
        if (test.isTestCaseFailing) {
          continue;
        }
      }
      test.generate();
      generatedCount++;
    }
  }
  print("$generatedCount $testsType tests generated successfully");
}

class Test {
  final File _testType;
  final File _testCase;
  final Directory _outputDir;
  late final String _testTypeFileName;
  late final String _testCaseFileName;
  List<String> _testTypeLines = [];
  List<String> _testCaseLines = [];
  bool _isDynamic = false;

  Test(this._testType, this._testCase, this._outputDir, this._isDynamic) {
    _testTypeFileName = _getFileName(_testType);
    _testCaseFileName = _getFileName(_testCase);
  }

  void generate() {
    _testTypeLines = _testType.readAsStringSync().split("\n");
    _testCaseLines = _testCase.readAsStringSync().split("\n");

    if (_isDynamic) {
      _addImport(_testTypeLines, isTestTypeFailing);
    }

    // Find //# T0 = ActualType
    Map<String, String> replacement = _findReplacements(_testTypeLines);
    // Replace T0 by ActualType
    _replace(_testCaseLines, replacement);
    List<String> testCaseHeader = _removeHeader(_testCaseLines,
        returnCopyright: false);
    List<String> testTypeHeader = _removeHeader(_testTypeLines);
    List<String> testCaseLV = _removeHeader(_testCaseLines,
        isLanguageVersion: true);
    List<String> testTypeLV = _removeHeader(_testTypeLines,
        isLanguageVersion: true);
    List<String> languageVersion = (testCaseLV.isEmpty ? testTypeLV : testCaseLV);
    if (!languageVersion.isEmpty) {
      languageVersion.insert(0, "");
    }

    List<String> test = [];
    if (_hasMain(_testTypeLines)) {
      test = [
        ...testTypeHeader,
        "///",
        ...testCaseHeader,
        _getGeneratedFileHeader,
        ...languageVersion,
        ..._replaceMain(_testTypeLines, _getBeforeMain(_testCaseLines),
            _getMainContent(_testCaseLines))
      ];
    } else {
      test = [
        ...testTypeHeader,
        "///",
        ...testCaseHeader,
        _getGeneratedFileHeader,
        ...languageVersion,
        ..._testTypeLines,
        ..._testCaseLines
      ];
    }
    File generatedTest = _createGeneratedTestFile();
    test = _removeUnusedVariable(test, "t1Instance");
    test = _removeUnusedVariable(test, "t1Default");
    generatedTest.writeAsStringSync(_toNormalizedString(test));
  }

  bool get isTestTypeFailing => _testTypeFileName.contains("_fail_");
  bool get isTestCaseFailing => _testCaseFileName.contains("_fail_");

  String _getFileName(File file) =>
      file.path.substring(file.path.lastIndexOf(Platform.pathSeparator) + 1);

  bool _hasMain(List<String> lines) {
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].contains(new RegExp(r"[\s]*main[\s]*\("))) {
        return true;
      }
    }
    return false;
  }

  void _addImport(List<String> lines, bool addExpect) {
    int ind = 0;
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].startsWith("///")) {
        ind = i;
      }
    }
    if (addExpect) {
      lines.insert(ind + 1, IMPORT_EXPECT);
    }
    lines.insert(ind + 1, IMPORT_COMMON);
  }

  Map<String, String> _findReplacements(List<String> lines) {
    Map<String, String> found = new Map<String, String>();
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].startsWith(META_PREFIX)) {
        String s = lines[i].substring(META_PREFIX.length).trim();
        List<String> l = s.split("=");
        if (l.length != 2) {
          continue;
        }
        String key = l[0].trim();
        String value = l[1].trim();
        found[key] = value;
        lines[i] = "";
      }
    }
    return found;
  }

  void _replace(List<String> lines, Map<String, String> replacement) {
    replacement.keys.toList().forEach((String Ti) {
      String? actualType = replacement[Ti];
      if (actualType != null) {
        for (int i = 0; i < lines.length; i++) {
          lines[i] = lines[i].replaceAll(Ti, actualType);
        }
      }
    });
  }

  List<String> _removeHeader(List<String> lines,
      {bool returnCopyright = true, bool isLanguageVersion = false}) {
    bool copyrightPart = false;
    bool assertionPart = false;
    bool languageVersionPart = false;
    List<String> header = [];
    for (int i = lines.length - 1; i >= 0; i--) {
      if (lines[i].trim().length == 0) {
        continue;
      }
      if (isLanguageVersion) {
        if (lines[i].startsWith("// @dart=")) {
          languageVersionPart = true;
        }
        if (languageVersionPart) {
          if (lines[i].startsWith("// ")) {
            header.insert(0, lines[i]);
            lines.removeAt(i);
          } else {
            break;
          }
        }
      } else {
        if (lines[i].startsWith("///")) {
          if (!assertionPart) {
            assertionPart = true;
          }
          header.insert(0, lines[i]);
          lines.removeAt(i);
        } else if (lines[i].startsWith("//")) {
          if (!assertionPart && !copyrightPart) {
            continue;
          }
          if (assertionPart) {
            assertionPart = false;
            copyrightPart = true;
            if (returnCopyright) {
              header.insert(0, "");
            }
          }
          if (returnCopyright) {
            header.insert(0, lines[i]);
          }
          lines.removeAt(i);
        }
      }
    }
    return header;
  }

  String get _getGeneratedFileHeader => '''
///
/// This test is generated from test_types/$_testTypeFileName and 
/// test_cases/$_testCaseFileName. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.
''';

  List<String> _getBeforeMain(List<String> lines) {
    List<String> found = [];
    for (int i = 0; i < lines.length; i++) {
      if (!lines[i].contains(new RegExp(r"main[\s]*\("))) {
        found.add(lines[i]);
      } else {
        break;
      }
    }
    return found;
  }

  List<String> _getMainContent(List<String> lines) {
    List<String> found = [];
    bool go = false;
    for (int i = lines.length - 1; i >= 0; i--) {
      if (go) {
        if (lines[i].contains(new RegExp(r"main[\s]*\("))) {
          break;
        } else {
          found.insert(0, lines[i]);
        }
      } else {
        if (lines[i].contains("}")) {
          go = true;
        }
      }
    }
    return found;
  }

  List<String> _replaceMain(
      List<String> lines, List<String> beforeMain, List<String> mainContent) {
    List<String> result = [];
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].contains(new RegExp(
          r"//#\s*<!--\s*Global\s*variables\s*&\s*classes\s*definition\s*-->"))) {
        result.addAll(beforeMain);
      } else if (lines[i]
          .contains(new RegExp(r"//#\s*<!--\s*Test\s*body\s*-->"))) {
        int numOfSpaces = lines[i].indexOf(META_PREFIX);
        result.addAll(_makeIndent(numOfSpaces, mainContent));
      } else {
        result.add(lines[i]);
      }
    }
    return result;
  }

  List<String> _makeIndent(int newIndent, List<String> lines) {
    int currentIndent = lines[0].indexOf(RegExp(r"\S"));
    if (currentIndent > 0 && newIndent > currentIndent) {
      String _old = List.filled(currentIndent, " ").join();
      String _new = List.filled(newIndent, " ").join();
      for (int i = 0; i < lines.length; i++) {
        lines[i] = lines[i].replaceFirst(_old, _new);
      }
    }
    return lines;
  }

  File _createGeneratedTestFile() {
    // _testTypeFileName looks like interface_compositionality_A01.dart
    // prefix = interface_compositionality, suffix = _A01
    int index = _testTypeFileName.lastIndexOf("_");
    String testNamePrefix = _testTypeFileName.substring(0, index);
    String testNameSuffix = _testTypeFileName.substring(index, index + 4);

    // testCaseName file name looks like arguments_binding_x01.dart
    // prefix = arguments_binding, suffix = _x01.dart
    index = _testCaseFileName.lastIndexOf("_");
    String testCasePrefix = _testCaseFileName.substring(0, index);
    String testCaseSuffix =
        _testCaseFileName.substring(index).replaceFirst("x", "t");

    String generatedTestName = "";
    File? generatedFile = null;
    String testNameSuffix2 = "";
    for (int i = 1;; i++) {
      generatedTestName = testNamePrefix +
          "_" +
          testCasePrefix +
          testNameSuffix +
          testNameSuffix2 +
          testCaseSuffix;
      generatedFile = new File(
          _outputDir.path + Platform.pathSeparator + generatedTestName);
      if (generatedFile.existsSync()) {
        testNameSuffix2 = "_$i";
      } else {
        break;
      }
    }
    generatedFile.createSync();
    return generatedFile;
  }

  // Remove excessive empty lines
  String _toNormalizedString(List<String> lines) {
    int counter = 0;
    for (int i = lines.length - 1; i >= 0; i--) {
      lines[i] = lines[i].trimRight();
      if (lines[i].length == 0) {
        counter++;
      } else {
        if (counter > 1) {
          for (int j = counter; j > 1; j--) {
            lines.removeAt(i + j);
          }
        }
        counter = 0;
      }
    }
    StringBuffer sb = new StringBuffer();
    sb.writeAll(lines, "\n");
    String rez = sb.toString();
    return rez;
  }

  List<String> _removeUnusedVariable(List<String> lines, String varName) {
    int lineNumber = -1;
    int endLineNumber = -1;
    RegExp pattern = RegExp(varName + r"[^0-9a-zA-Z]");
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].contains(pattern)) {
        if (lineNumber == -1) {
          lineNumber = i;
          for (int j = i;;j++) {
            if (lines[j].contains(";")) {
              endLineNumber = j;
              break;
            }
          }
        } else {
          return lines;
        }
      }
    }
    if (lineNumber != -1) {
      for (int i = endLineNumber; i >= lineNumber; i--) {
        lines.removeAt(i);
      }
    }
    return lines;
  }
}
