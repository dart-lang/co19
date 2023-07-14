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
/// methods
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class C {
  external static int s1();
  external static int s2([var x]);
  external static int s3({var x});
  external static int s4({required var x});

  external int m1();
  external int m2([var x]);
  external int m3({var x});
  external int m4({required var x});
}

main() {
  C c = C();
  Expect.throws(() { int i = c.m1(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { int i = c.m2(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { int i = c.m3(x: 1); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { int i = c.m4(x: 1); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { int i = C.s1(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { int i = C.s2(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { int i = C.s3(x: 1); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { int i = C.s4(x: 1); }, (e) => e is NoSuchMethodError);
}
