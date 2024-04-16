// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The augmenting function does not have to pass the same arguments
/// to augmented() as were passed to it. It may call it once, more than once, or
/// not at all.
///
/// @description Checks that it's not an error if augmenting function passes
/// different arguments to the `augmented()` expression and calls it more than
/// once. Test instance methods of an extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A03_t10_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

void clearLog() {
  _log = "";
}

class A {}

extension Ext on A {
  String instanceMethod1() {
    _log += "instanceMethod1();";
    return "Original;";
  }

  String instanceMethod2(String v) {
    _log += "instanceMethod2($v);";
    return "Original v=$v;";
  }

  String instanceMethod3(String v1, [String v2 = "v2 def"]) {
    _log += "instanceMethod3($v1, [$v2]);";
    return "Original v1=$v1, [v2=$v2];";
  }

  String instanceMethod4(String v1, {String v2 = "v2 def"}) {
    _log += "instanceMethod4($v1, {$v2});";
    return "Original v1=$v1, {v2=$v2};";
  }

  String instanceMethod5(String v1, {required String v2}) {
    _log += "instanceMethod5($v1, {required $v2});";
    return "Original v1=$v1, {required v2=$v2};";
  }
}

main() {
  Expect.equals("augment;", A().instanceMethod1());
  Expect.equals(
      "instanceMethod1();Original;augmented;instanceMethod1();", _log);
  clearLog();

  Expect.equals("augment instanceMethod2(A);", A().instanceMethod2("A"));
  Expect.equals("instanceMethod2(a);Original v=A;augmented;instanceMethod2(b);",
      _log);
  clearLog();

  Expect.equals("augment v1=B, [v2=C]", A().instanceMethod3("B", "C"));
  Expect.equals("instanceMethod3(c, [d]);Original v1=B, [v2=C];augmented;" +
      "instanceMethod3(e, [f]);", _log);
  clearLog();

  Expect.equals("augment v1=D, {v2=E}", A().instanceMethod4("D", v2: "E"));
  Expect.equals("instanceMethod4(g, {h});Original v1=D, {v2=E};augmented;" +
      "instanceMethod4(i, {j});", _log);
  clearLog();

  Expect.equals(
      "augment v1=F, {required v2=G}", A().instanceMethod5("F", v2: "G"));
  Expect.equals(
      "instanceMethod5(k, {required l});Original v1=F, {required v2=G};" +
          "augmented;instanceMethod5(m, {required n});", _log);
}
