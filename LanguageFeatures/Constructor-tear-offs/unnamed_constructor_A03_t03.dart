// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Apart from the tear-off, this code will mean exactly the same
/// thing as the same code without the .new.
///
/// @description Checks that [new] call is equivalent with the default
/// constructor call. Tests constructor with arguments.
///
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class A {
  int i = 0;
  String s = "";

  A(this.i, this.s);

  static void check(exp1, exp2) {
    A a = A.new(exp1, exp2);
    Expect.equals(exp1, a.i);
    Expect.equals(exp2, a.s);
  }
}

main() {
  A.check(1, "Testme");
  A.check(-2, "Stop");
}
