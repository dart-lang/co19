// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The augmenting function does not have to pass the same arguments
/// to `augmented(…)` as were passed to it. It may invoke `augmented` once, more
/// than once, or not at all.
///
/// @description Checks that it's not an error if an augmenting function passes
/// different arguments to the `augmented()` expression and calls it more than
/// once. Test a top-level function
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A03_t01_lib.dart';
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
  Expect.equals("augment;", topLevelFunction1("A"));
  Expect.equals("topLevelFunction1();Original;augmented;topLevelFunction1();",
      _log);
  clearLog();

  Expect.equals("augment v=A;", topLevelFunction2("A"));
  Expect.equals("topLevelFunction2(a);Original v=A;augmented;" +
      "topLevelFunction2(b);", _log);
  clearLog();

  Expect.equals("augment v1=B, [v2=C]", topLevelFunction3("B", "C"));
  Expect.equals("topLevelFunction3(c, [d]);Original v1=B, [v2=C];augmented;" +
      "topLevelFunction3(e, [f]);", _log);
  clearLog();

  Expect.equals("augment v1=D, {v2=E}", topLevelFunction4("D", v2: "E"));
  Expect.equals("topLevelFunction4(j, {h});Original v1=D, {v2=E};augmented;" +
      "topLevelFunction4(i, {j});", _log);
  clearLog();

  Expect.equals("augment v1=F, {required v2=G}",
      topLevelFunction5("F", v2: "G"));
  Expect.equals(
      "topLevelFunction5(k, {required l});Original v1=F, {required v2=G};" +
          "augmented;topLevelFunction5(m, {required n});", _log);
}
