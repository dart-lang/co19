// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An external function is a function whose body is provided
/// separately from its declaration. An external function may be a top-level
/// function, a method, a getter, a setter, or a non-redirecting constructor.
/// ...
/// Attempting to invoke an external function that has not been connected to its
/// body will raise a NoSuchMethodError or some subclass thereof.
///
/// @description Checks that invoking an external function that is not connected
/// to its body indeed results in a `NoSuchMethodError` being thrown. Test
/// non-redirecting constructors
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class C {
  external C();
  external C.n1([var x]);
  external C.n2({var x});
  external C.n3({required var x});
  external factory C.f1();
  external factory C.f2([var x]);
  external factory C.f3({var x});
  external factory C.f4({required var x});
  external const C.c1();
  external const C.c2([var x]);
  external const C.c3({var x});
  external const C.c4({required var x});
}

main() {
  Expect.throws(() { C c = C(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { C c = C.n1(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { C c = C.n2(x: 1); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { C c = C.n3(x: 1); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { C c = C.f1(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { C c = C.f2(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { C c = C.f3(x: 0); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { C c = C.f4(x: 1); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { C c = C.c1(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { C c = C.c2(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { C c = C.c3(x: 0); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { C c = C.c4(x: 1); }, (e) => e is NoSuchMethodError);
}
