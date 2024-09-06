// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, or operator
/// may be augmented to wrap the original code in additional code. The
/// augmentation replaces the original function body with the augmenting code.
///
/// @description Checks that a top-level function may be augmented and the
/// original code is replaced by the augmentation
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_functions_A01_t01_lib.dart';

String _log = "";

void clearLog() {
  _log = "";
}

String topLevelFunction1() {
  _log += "Original topLevelFunction1;";
  return "Original";
}

String topLevelFunction2(String v) {
  _log += "Original topLevelFunction2($v);";
  return "Original v=$v";
}

String topLevelFunction3(String v1, [String v2 = "v2 def"]) {
  _log += "Original topLevelFunction3($v1, [$v2]);";
  return "Original v1=$v1, [v2=$v2]";
}

String topLevelFunction4(String v1, {String v2 = "v2 def"}) {
  _log += "Original topLevelFunction4($v1, {$v2});";
  return "Original v1=$v1, {v2=$v2}";
}

String topLevelFunction5(String v1, {required String v2}) {
  _log += "Original topLevelFunction5($v1, {required $v2});";
  return "Original v1=$v1, {required v2=$v2}";
}

main() {
  Expect.equals("augment", topLevelFunction1());
  Expect.equals("augment topLevelFunction1();", _log);
  clearLog();

  Expect.equals("augment v=A", topLevelFunction2("A"));
  Expect.equals("augment topLevelFunction2(A);", _log);
  clearLog();

  Expect.equals("augment v1=B, [v2=C]", topLevelFunction3("B", "C"));
  Expect.equals("augment topLevelFunction3(B, [C]);", _log);
  clearLog();

  Expect.equals("augment v1=D, {v2=E}", topLevelFunction4("D", v2: "E"));
  Expect.equals("augment topLevelFunction4(D, {E});", _log);
  clearLog();

  Expect.equals("augment v1=F, {required v2=G}",
      topLevelFunction5("F", v2: "G"));
  Expect.equals("augment topLevelFunction5(F, {required G});", _log);
}
