// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, or operator
/// may be augmented to wrap the original code in additional code. The
/// augmentation replaces the original function body with the augmenting code.
///
/// @description Checks that an instance method may be augmented and the 
/// original code is replaced by the augmentation. Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_functions_A01_t11_lib.dart';

String _log = "";

void clearLog() {
  _log = "";
}

extension type ET(int id) {
  String instanceMethod1() {
    _log += "Original instanceMethod1();";
    return "Original";
  }

  String instanceMethod2(String v) {
    _log += "Original instanceMethod2($v);";
    return "Original v=$v";
  }

  String instanceMethod3(String v1, [String v2 = "v2 def"]) {
    _log += "Original instanceMethod3($v1, [$v2]);";
    return "Original v1=$v1, [v2=$v2]";
  }

  String instanceMethod4(String v1, {String v2 = "v2 def"}) {
    _log += "Original instanceMethod4($v1, {$v2});";
    return "Original v1=$v1, {v2=$v2}";
  }

  String instanceMethod5(String v1, {required String v2}) {
    _log += "Original instanceMethod5($v1, {required $v2});";
    return "Original v1=$v1, {required v2=$v2}";
  }
}

main() {
  ET et = ET(0);
  Expect.equals("augment", et.instanceMethod1());
  Expect.equals("augment instanceMethod1();", _log);
  clearLog();

  Expect.equals("augment v=A", et.instanceMethod2("A"));
  Expect.equals("augment instanceMethod2(A);", _log);
  clearLog();

  Expect.equals("augment v1=B, [v2=C]", et.instanceMethod3("B", "C"));
  Expect.equals("augment instanceMethod3(B, [C]);", _log);
  clearLog();

  Expect.equals("augment v1=D, {v2=E}", et.instanceMethod4("D", v2: "E"));
  Expect.equals("augment instanceMethod4(D, {E});", _log);
  clearLog();

  Expect.equals("augment v1=F, {required v2=G}",
      et.instanceMethod5("F", v2: "G"));
  Expect.equals("augment instanceMethod5(F, {required G});", _log);
}
