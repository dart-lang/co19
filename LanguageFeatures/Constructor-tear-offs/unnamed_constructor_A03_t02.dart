// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Apart from the tear-off, this code will mean exactly the same
/// thing as the same code without the .new.
///
/// @description Checks that [new] call is equivalent with the default
/// constructor call. Tests super constructor reference.
///
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class A {
  static int called_a = 0;
  A() {
    called_a++;
  }
}

class B extends A {
  static int called_b = 0;
  B() : super() {
    called_b++;
  }
}

main() {
  B b = B.new();
  Expect.equals(1, A.called_a);
  Expect.equals(1, B.called_b);

  B();
  Expect.equals(2, A.called_a);
  Expect.equals(2, B.called_b);

  A.new();
  Expect.equals(3, A.called_a);
  Expect.equals(2, B.called_b);

  B.new();
  Expect.equals(4, A.called_a);
  Expect.equals(3, B.called_b);

  A();
  Expect.equals(5, A.called_a);
  Expect.equals(3, B.called_b);

  B();
  Expect.equals(6, A.called_a);
  Expect.equals(4, B.called_b);
}
