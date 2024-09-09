// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Inside the augmentation body, a special `augmented()` expression
/// may be used to execute the original function body. That expression takes an
/// argument list matching the original function's parameter list and returns
/// the function's return type.
///
/// @description Checks that inside an augmentation body of an instance method
/// `augmented()` expression executes the original method body. Test an
/// extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_functions_A02_t11_lib.dart';

String _log = "";

void clearLog() {
  _log = "";
}

extension type ET(int id) {
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
  Expect.equals("augment;", ET(0).instanceMethod1());
  Expect.equals("instanceMethod1();Original;augmented;", _log);
  clearLog();

  Expect.equals("augment v=A;", ET(0).instanceMethod2("A"));
  Expect.equals("instanceMethod2(A);Original v=A;augmented;", _log);
  clearLog();

  Expect.equals("augment v1=B, [v2=C]", ET(0).instanceMethod3("B", "C"));
  Expect.equals("instanceMethod3(B, [C]);Original v1=B, [v2=C];augmented;",
      _log);
  clearLog();

  Expect.equals("augment v1=D, {v2=E}", ET(0).instanceMethod4("D", v2: "E"));
  Expect.equals("instanceMethod4(D, {E});Original v1=D, {v2=E};augmented;",
      _log);
  clearLog();

  Expect.equals("augment v1=F, {required v2=G}",
      ET(0).instanceMethod5("F", v2: "G"));
  Expect.equals(
      "instanceMethod5(F, {required G});Original v1=F, {required v2=G};" +
          "augmented;", _log);
}
