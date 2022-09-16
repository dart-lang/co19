// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Apart from the tear-off, this code will mean exactly the same
/// thing as the same code without the .new.
///
/// @description Checks that [new] declaration is equivalent with default
/// constructor declaration.
///
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class A<T> {
  int i = 0;
  String s = "";

  A.new(this.i, this.s);

  void check(exp1, exp2, exp3) {
    Expect.equals(exp1, i);
    Expect.equals(exp2, s);
    Expect.equals(exp3, T);
  }
}

main() {
  A(1, "Testme").check(1, "Testme", dynamic);
  A.new(1, "Testme").check(1, "Testme", dynamic);

  A<int>(12345, "").check(12345, "", int);
  A<int>.new(12345, "").check(12345, "", int);

  A<Never>(0, "0").check(0, "0", Never);
  A<Never>.new(0, "0").check(0, "0", Never);
}
