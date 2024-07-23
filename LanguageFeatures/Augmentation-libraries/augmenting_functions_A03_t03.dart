// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The augmenting function does not have to pass the same arguments
/// to `augmented(…)` as were passed to it. It may invoke `augmented` once, more
/// than once, or not at all.
///
/// @description Checks that it's not an error if an augmenting function passes
/// different arguments to the `augmented()` expression and calls it more than
/// once. Test static methods of a mixin.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A03_t03_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

void clearLog() {
  _log = "";
}

mixin M {
  static String staticMethod1() {
    _log += "staticMethod1();";
    return "Original;";
  }

  static String staticMethod2(String v) {
    _log += "staticMethod2($v);";
    return "Original v=$v;";
  }

  static String staticMethod3(String v1, [String v2 = "v2 def"]) {
    _log += "staticMethod3($v1, [$v2]);";
    return "Original v1=$v1, [v2=$v2];";
  }

  static String staticMethod4(String v1, {String v2 = "v2 def"}) {
    _log += "staticMethod4($v1, {$v2});";
    return "Original v1=$v1, {v2=$v2};";
  }

  static String staticMethod5(String v1, {required String v2}) {
    _log += "staticMethod5($v1, {required $v2});";
    return "Original v1=$v1, {required v2=$v2};";
  }
}

main() {
  Expect.equals("augment;", M.staticMethod1());
  Expect.equals("staticMethod1();Original;augmented;staticMethod1();", _log);
  clearLog();

  Expect.equals("augment staticMethod2(A);", M.staticMethod2("A"));
  Expect.equals("staticMethod2(a);Original v=A;augmented;staticMethod2(b);",
      _log);
  clearLog();

  Expect.equals("augment v1=B, [v2=C]", M.staticMethod3("B", "C"));
  Expect.equals("staticMethod3(c, [d]);Original v1=B, [v2=C];augmented;" +
      "staticMethod3(e, [f]);", _log);
  clearLog();

  Expect.equals("augment v1=D, {v2=E}", M.staticMethod4("D", v2: "E"));
  Expect.equals("staticMethod4(g, {h});Original v1=D, {v2=E};augmented;" +
      "staticMethod4(i, {j});", _log);
  clearLog();

  Expect.equals("augment v1=F, {required v2=G}", M.staticMethod5("F", v2: "G"));
  Expect.equals(
      "staticMethod5(k, {required l});Original v1=F, {required v2=G};" +
          "augmented;staticMethod5(m, {required n});", _log);
}
