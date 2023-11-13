// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a dynamic type error if a factory returns a non-null object
/// whose type is not a subtype of its actual return type.
///
/// @description Checks that it is a dynamic type error if a factory returns a
/// non-null object  whose type is not a subtype of its actual return type.
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

class A {}

class C extends A {
  factory C() => "42" as dynamic;

  factory C.f1() => A() as dynamic;

  factory C.f2() => A() as C;
}

enum E implements A {
  e1, e2;
  const E();

  factory E.f1() => "42" as dynamic;

  factory E.f2() => A() as dynamic;

  factory E.f3() => A() as E;
}

main() {
  Expect.throws(() {
    C();
  });
  Expect.throws(() {
    C.f1();
  });
  Expect.throws(() {
    C.f2();
  });
  Expect.throws(() {
    E.f1();
  });
  Expect.throws(() {
    E.f2();
  });
  Expect.throws(() {
    E.f3();
  });
}
