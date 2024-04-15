// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, or operator
/// may be augmented to wrap the original code in additional code. The
/// augmentation replaces the original function body with the augmenting code.
/// Inside the augmentation body, a special augmented() expression may be used
/// to execute the original function body. That expression takes an argument
/// list matching the original function's parameter list and returns the
/// function's return type.
///
/// @description Checks that inside an augmentation body of a top-level function
/// `augmented()` expression executes the original function body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A02_t01_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

void clearLog() {
  _log = "";
}

String topLevelFunction1() {
  _log += "topLevelFunction1();";
  return "Original;";
}

String topLevelFunction2(String v) {
  _log += "topLevelFunction2($v);";
  return "Original v=$v;";
}

String topLevelFunction3(String v1, [String v2 = "v2 def"]) {
  _log += "topLevelFunction3($v1, [$v2]);";
  return "Original v1=$v1, [v2=$v2];";
}

String topLevelFunction4(String v1, {String v2 = "v2 def"}) {
  _log += "topLevelFunction4($v1, {$v2});";
  return "Original v1=$v1, {v2=$v2};";
}

String topLevelFunction5(String v1, {required String v2}) {
  _log += "topLevelFunction5($v1, {required $v2});";
  return "Original v1=$v1, {required v2=$v2};";
}

main() {
  Expect.equals("augment;", topLevelFunction1());
  Expect.equals("topLevelFunction1();Original;augmented;", _log);
  clearLog();

  Expect.equals("augment v=A;", topLevelFunction2("A"));
  Expect.equals("topLevelFunction2(A);Original v=A;augmented;", _log);
  clearLog();

  Expect.equals("augment v1=B, [v2=C]", topLevelFunction3("B", "C"));
  Expect.equals("topLevelFunction3(B, [C]);Original v1=B, [v2=C];augmented;",
      _log);
  clearLog();

  Expect.equals("augment v1=D, {v2=E}", topLevelFunction4("D", v2: "E"));
  Expect.equals("topLevelFunction4(D, {E});Original v1=D, {v2=E};augmented;",
      _log);
  clearLog();

  Expect.equals("augment v1=F, {required v2=G}",
      topLevelFunction5("F", v2: "G"));
  Expect.equals(
      "topLevelFunction5(F, {required G});Original v1=F, {required v2=G};" +
          "augmented;", _log);
}
