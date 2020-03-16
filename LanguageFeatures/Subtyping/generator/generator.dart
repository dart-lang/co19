/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/***
 * Generator for subtyping tests. Usage:
 * dart generator.dart
 * This call regenerates ../dynamic/generated and ../static/generated tests
 *
 * Writing tests for the generator
 *
 * Generator takes test types defined in ../test_types and for each test type
 * creates tests combining test cases defined in ../dynamic/test_cases and
 * ../static/test_cases
 *
 * Each test case tests that type @T0 is subtype of type @T1. Each test type
 * defines actual T0 and T1 and instances of these types with names t0Instance
 * and t1Instance. In the end of the file specifies substitution, for example:
 *
 * class T0 {}
 * T0 t0Instance = new T0();
 * dynamic t1Instance = 3.14;
 * //# @T0 = T0
 * //# @T1 = dynamic
 *
 * - If test case or test type is negative, then its name must contain "_fail_"
 * - If test type contains generic function types it must contain
 *   "//# @GenericFunctionType" string at the end. For example
 *   ...
 *  typedef T0 = U0<C, List<String>, int> Function<X extends B0, Y extends B1>(
 *  V0<dynamic, void, Object> x0, V1<dynamic, void, Object> x1,
 *  {V2<dynamic, void, Object> x2, V3<dynamic, void, Object> x3, V4<dynamic, void, Object> x4});
 *  typedef T1 = U1<dynamic, void, Object> Function<X extends B0, Y extends B1>(
 *  S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
 *  {S2<C, List<String>, int> x2, S3<C, List<String>, int> x3});
 *
 *  U0<C, List<String>, int> t0Func<X extends B0, Y extends B1>(
 *  V0<dynamic, void, Object> x0, V1<dynamic, void, Object> x1,
 *  {V2<dynamic, void, Object> x2, V3<dynamic, void, Object> x3,
 *  V4<dynamic, void, Object> x4}) => null;
 *  U1<dynamic, void, Object> t1Func<X extends B0, Y extends B1>(
 *  S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
 *  {S2<C, List<String>, int> x2, S3<C, List<String>, int> x3}) => null;
 *
 *  T0 t0Instance = t0Func;
 *  T1 t1Instance = t1Func;
 *  //# @T0 = T0
 *  //# @T1 = T1
 *  //# @GenericFunctionType
 *
 * - If test case has tests for the types which are not generic function types,
 * this block must be marked by
 *   //# <-- NotGenericFunctionType
 *   ...
 *   //# -->
 * TODO complete the description
 */
import "dart:io";

const GENERIC_FUNCTION_TYPE_FLAG = "@GenericFunctionType";
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

  Directory testCasesDir = new Directory(".." + Platform.pathSeparator +
      DYNAMIC_TESTS_DIR + Platform.pathSeparator + TEST_CASES_DIR);
  Directory testTypesDir = new Directory(".." + Platform.pathSeparator +
      TEST_TYPES_DIR);
  Directory outputDir = new Directory(".." + Platform.pathSeparator +
      DYNAMIC_TESTS_DIR + Platform.pathSeparator + OUTPUT_DIR);
  generateTests(testCasesDir, testTypesDir, outputDir, "dynamic");

  // Now generate tests for dynamic only test types
  testTypesDir = new Directory(".." + Platform.pathSeparator +
      DYNAMIC_TESTS_DIR + Platform.pathSeparator + TEST_TYPES_DIR);
  generateTests(testCasesDir, testTypesDir, outputDir, "dynamic", clear: false);

  // Generate static tests

  // First generate tests for common test types
  testCasesDir = new Directory(".." + Platform.pathSeparator +
      STATIC_TESTS_DIR + Platform.pathSeparator + TEST_CASES_DIR);
  testTypesDir = new Directory(".." + Platform.pathSeparator +
      TEST_TYPES_DIR);
  outputDir = new Directory(".." + Platform.pathSeparator +
      STATIC_TESTS_DIR + Platform.pathSeparator + OUTPUT_DIR);
  generateTests(testCasesDir, testTypesDir, outputDir, "static");

  // Now generate tests for static only test types

  testTypesDir = new Directory(".." + Platform.pathSeparator +
      STATIC_TESTS_DIR + Platform.pathSeparator + TEST_TYPES_DIR);
  generateTests(testCasesDir, testTypesDir, outputDir, "static", clear: false);

}

void generateTests(Directory testCasesDir, Directory testTypesDir,
    Directory outputDir, String testsType, {bool clear = true}) {
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
    File testType = testTypes[i];
    bool isFailTest = isFail(testType);
    String testTypeText = testType.readAsStringSync();
    List<String> testTypeTextStrings = testTypeText.split("\n");
    Map<String, String> replacement = null;
    bool hasMainFunc = hasMain(testTypeTextStrings);
    bool isGenericFunctionType = findIsGenericFunctionType(testTypeTextStrings);
    replacement = findReplacements(testTypeTextStrings);
    if (replacement.length == 0) {
      continue;
    }
    if (testsType != "static") {
      testTypeTextStrings = addImport(testTypeTextStrings, isFailTest);
    }
    for (int j = 0; j < testCases.length; j++) {
      File testCase = testCases[j];
      if (isFailTest) {
        if (!isFail(testCase)) {
          continue;
        }
      } else {
        if (isFail(testCase)) {
          continue;
        }
      }
      String testCaseText = testCase.readAsStringSync();
      testCaseText = removeNotGenericFunctionTypePart(isGenericFunctionType,
          testCaseText);
      testCaseText = replace(testCaseText, replacement);
      String testTypeText = removeReplacements(testTypeTextStrings);

      String header = getGeneratedTestHeader(testTypeText, testCaseText,
          getGeneratedFileComment(testType, testCase));
      testCaseText = removeHeader(testCaseText);
      testTypeText = removeHeader(testTypeText);
      String generatedTestText = null;
      if (hasMainFunc) {
        String beforeMain = getBeforeMain(testCaseText);
        String mainContent = getMainContent(testCaseText);
        generatedTestText = header + testTypeText.replaceFirst(
            new RegExp(r"\/\/#\s*<!--\s*Global\s*variables\s*&\s*classes\s*definition\s*-->"),
            beforeMain).replaceFirst(new RegExp(r"\/\/#\s*<!--\s*Test\s*body\s*-->"), mainContent);
      } else {
        generatedTestText = header + removeHeader(testTypeText) + testCaseText;
      }
      File generatedTest = getGeneratedTestFile(testType, testCase, outputDir);
      generatedTest.writeAsStringSync(generatedTestText);
      generatedCount++;
    }
  }
  print("$generatedCount $testsType tests generated successfully");
}

String getGeneratedFileComment(File testType, File testCase) {
  String testTypeFileName = getFileName(testType);
  String testCaseFileName = getFileName(testCase);
  return '''/*
 * This test is generated from $testTypeFileName and 
 * $testCaseFileName.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */''';
}

bool findIsGenericFunctionType(List<String> strings) {
  for (int i = 0; i < strings.length; i++) {
    if (strings[i].startsWith(META_PREFIX)) {
      String s = strings[i].substring(META_PREFIX.length).trim();
      if (s == GENERIC_FUNCTION_TYPE_FLAG) {
        return true;
      }
    }
  }
  return false;
}

bool hasMain(List<String> strings) {
  for (int i = 0; i < strings.length; i++) {
    if (strings[i].contains(new RegExp(r"[\s]*main[\s]*\("))) {
      return true;
    }
  }
  return false;
}

Map<String, String> findReplacements(List<String> strings) {
  Map<String, String> found = new Map<String, String>();
  for (int i = 0; i < strings.length; i++) {
    if (strings[i].startsWith(META_PREFIX)) {
      String s = strings[i].substring(META_PREFIX.length).trim();
      List<String> l = s.split("=");
      if (l.length != 2) {
        continue;
      }
      String key = l[0].trim();
      String value = l[1].trim();
      found[key] = value;
    }
  }
  return found;
}

String removeHeader(String text) {
  // If file begins with /* - remove this comment
  int start = text.indexOf("/*");
  int end = text.indexOf("*/");
  if (start > -1 && end > -1) {
    text = text.replaceRange(start, end + 2, "");
    // If there is one more comment - remove it as well
    start = text.indexOf("/*");
    end = text.indexOf("*/");
    if (start > -1 && end > -1) {
      text = text.replaceRange(start, end + 2, "");
    }
  }
  return text;
}

String getComment(String text, int index) {
  int start = text.indexOf("/*");
  int end = text.indexOf("*/");
  if (index > 0) {
    start = text.indexOf("/*", start + 1);
    end = text.indexOf("*/", end + 1);
  }
  if (start > -1 && end > -1) {
    return text.substring(start, end + 2);
  }
  return null;
}

String getGeneratedTestHeader(String testTypeText, String testCaseText, String text) {
  String copyright = getComment(testTypeText, 0);
  String testTypeComment = getComment(testTypeText, 1);
  String testCaseComment = getComment(testCaseText, 1);
  return copyright + "\n"
      + testTypeComment + "\n"
      + testCaseComment + "\n"
      + text + "\n";
}

String removeReplacements(List<String> strings) {
  List<String> found = [];
  for (int i = 0; i < strings.length; i++) {
    if (strings[i].startsWith(new RegExp("$META_PREFIX\\s+@"))) {
      found.add(strings[i]);
    }
  }
  found.forEach((String el) {
    strings.remove(el);
  });
  StringBuffer sb = new StringBuffer();
  sb.writeAll(strings, "\n");
  return sb.toString();
}

String removeNotGenericFunctionTypePart(bool isGenericFunctionType, String text) {
  if (isGenericFunctionType) {
    List<String> strings = text.split("\n");
    bool skip = false;
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < strings.length; i++) {
      if (strings[i].trim().startsWith(META_PREFIX)) {
        if (skip) {
          if (strings[i].contains("-->")) {
            skip = false;
            continue;
          } else {
            throw new Exception("Unexpected '${strings[i]}'");
          }
        } else {
          if (strings[i].contains("NotGenericFunctionType")) {
            skip = true;
            continue;
          }
        }
      } else {
        if (skip) {
          continue;
        } else {
          sb.write(strings[i] + "\n");
        }
      }
    }
    return sb.toString();
  } else {
    // remove "//# <-- NotGenericFunctionType" and "//# -->"
    return text.replaceFirst("$META_PREFIX <-- NotGenericFunctionType\n", "").replaceFirst("$META_PREFIX -->\n", "");
  }
}

String replace(String text, Map<String, String> replacement) {
  replacement.keys.toList().forEach((String Ti) {
    text = text.replaceAll(Ti, replacement[Ti]);
  });
  return text;
}

File getGeneratedTestFile(File testType, File testCase, Directory outputDir) {
  String testTypeName = getFileName(testType);
  String testCaseName = getFileName(testCase);
  // testTypeName file name looks like interface_compositionality_A01.dart
  // prefix = interface_compositionality, suffix = _A01
  int index = testTypeName.lastIndexOf("_");
  String testNamePrefix = testTypeName.substring(0, index);
  String testNameSuffix = testTypeName.substring(index, index + 4);

  // testCaseName file name looks like arguments_binding_x01.dart
  // prefix = arguments_binding, suffix = _x01.dart
  index = testCaseName.lastIndexOf("_");
  String testCasePrefix = testCaseName.substring(0, index);
  String testCaseSuffix = testCaseName.substring(index).replaceFirst("x", "t");

  String generatedTestName = null;
  File generatedFile = null;
  String testNameSuffix2 = "";
  for (int i = 1;;i++) {
    generatedTestName = testNamePrefix + "_" + testCasePrefix +
        testNameSuffix + testNameSuffix2 + testCaseSuffix;
    generatedFile = new File(outputDir.path + Platform.pathSeparator + generatedTestName);
    if (generatedFile.existsSync()) {
      testNameSuffix2 = "_$i";
    } else {
      break;
    }
  }
  generatedFile.createSync();
  return generatedFile;
}

String getFileName(File file) =>
    file.path.substring(file.path.lastIndexOf(Platform.pathSeparator) + 1);

bool isFail(File file) => getFileName(file).contains("_fail_");

List<String> addImport(List<String> testTypeTextStrings, bool addExpect) {
  int counter = 0;
  for (int i = 0; i < testTypeTextStrings.length; i++) {
    if (testTypeTextStrings[i].contains("*/")) {
      counter++;
    }
    if (counter == 2) {
      if (addExpect) {
        testTypeTextStrings.insert(i + 1, IMPORT_EXPECT);
      }
      testTypeTextStrings.insert(i + 1, IMPORT_COMMON);
      break;
    }
  }
  return testTypeTextStrings;
}

String getBeforeMain(String text) {
  return text.substring(0, text.indexOf(new RegExp(r"main[\s]*\(")));
}

String getMainContent(String text) {
  int start = text.indexOf("{", text.indexOf(new RegExp(r"main\s*\(.*\)\s*\{")));
  int end = text.lastIndexOf("}");
  return text.substring(start + 1, end);
}
