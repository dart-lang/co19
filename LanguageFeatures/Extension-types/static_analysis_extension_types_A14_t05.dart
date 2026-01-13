// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type declaration `DV`
/// has two extension type superinterfaces `V1` and `V2`, and both `V1` and `V2`
/// has an extension type member named `m` that is not precluded by `DV`, and
/// the two members have distinct declarations.
///
/// @description Checks that it is not an error if an extension type implements
/// conflicting interfaces but declares its own member which resolves the
/// conflict.
/// @author sgrekhov22@gmail.com
/// @issue 62382

import "../../Utils/expect.dart";

String log = "";

class A {
  void m() {}
}

extension type ET(A a) {
  void set m(int v) {
    log = "ET";
  }
}

extension type ET1(A id) implements A, ET {
  int get m => 1;
}

extension type ET2(A id) implements A, ET {
  int m() => 2;
}

extension type ET3(A id) implements A, ET {
  void set m(int _) {
    log = "ET3";
  }
}

main() {
  var et1 = ET1(A());
  Expect.equals(1, et1.m);
  et1.m = 2; // Ok, getter doesn't preclude setter
  Expect.equals("ET", log);

  var et2 = ET2(A());
  Expect.equals(2, et2.m());

  var et3 = ET3(A());
  et3.m = 3;
  Expect.equals("ET3", log);
}
