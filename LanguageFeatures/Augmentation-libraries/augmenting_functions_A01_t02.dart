// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, or operator
/// may be augmented to wrap the original code in additional code. The
/// augmentation replaces the original function body with the augmenting code.
///
/// @description Checks that a static method may be augmented and the original
/// code is replaced by the augmentation. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A01_t02_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

void clearLog() {
  _log = "";
}

class C {
  static String staticMethod1() {
    _log += "Original staticMethod1;";
    return "Original";
  }

  static String staticMethod2(String v) {
    _log += "Original staticMethod2($v);";
    return "Original v=$v";
  }

  static String staticMethod3(String v1, [String v2 = "v2 def"]) {
    _log += "Original staticMethod3($v1, [$v2]);";
    return "Original v1=$v1, [v2=$v2]";
  }

  static String staticMethod4(String v1, {String v2 = "v2 def"}) {
    _log += "Original staticMethod4($v1, {$v2});";
    return "Original v1=$v1, {v2=$v2}";
  }

  static String staticMethod5(String v1, {required String v2}) {
    _log += "Original staticMethod5($v1, {required $v2});";
    return "Original v1=$v1, {required v2=$v2}";
  }
}

main() {
  Expect.equals("augment", C.staticMethod1());
  Expect.equals("augment staticMethod1();", _log);
  clearLog();

  Expect.equals("augment v=A", C.staticMethod2("A"));
  Expect.equals("augment staticMethod2(A);", _log);
  clearLog();

  Expect.equals("augment v1=B, [v2=C]", C.staticMethod3("B", "C"));
  Expect.equals("augment staticMethod3(B, [C]);", _log);
  clearLog();

  Expect.equals("augment v1=D, {v2=E}", C.staticMethod4("D", v2: "E"));
  Expect.equals("augment staticMethod4(D, {E});", _log);
  clearLog();

  Expect.equals("augment v1=F, {required v2=G}", C.staticMethod5("F", v2: "G"));
  Expect.equals("augment staticMethod5(F, {required G});", _log);
}
