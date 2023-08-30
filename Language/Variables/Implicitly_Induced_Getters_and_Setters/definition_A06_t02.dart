// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Setter: Late-final variable with declared type ⟩. A
/// variable declaration of the form static? late final T id; implicitly induces
/// a setter with the header void set id(T x). If this setter is executed in a
/// situation where the variable id has not been bound, it will bind id to the
/// object that x is bound to. If this setter is executed in a situation where
/// the variable id has been bound to an object, a dynamic error occurs
///
/// @description Checks that it is a dynamic error if this setter is executed in
/// a situation where the variable has been bound to an object
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

late final int x1;

class C {
  static late final int v1;
  late final int v2;
}

main() {
  x1 = 1;
  Expect.throws(() {
    x1 = 2;
  });
  C.v1 = 1;
  Expect.throws(() {
    C.v1 = 2;
  });
  C c = C();
  c.v2 = 2;
  Expect.throws(() {
    c.v2 = 3;
  });
}
