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
/// setters
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

external void set s0(int v);

class C1 {
  external static void set s1(int v);
  external void set s2(int v);
}

mixin M {
  external static void set s1(int v);
  external void set s2(int v);
}

class C2 = Object with M;

main() {
  C1 c1 = C1();
  C2 c2 = C2();
  Expect.throws(() { s0 = 0; }, (e) => e is NoSuchMethodError);
  Expect.throws(() { C1.s1 = 1; }, (e) => e is NoSuchMethodError);
  Expect.throws(() { c1.s2 = 2; }, (e) => e is NoSuchMethodError);
  Expect.throws(() { M.s1 = 3; }, (e) => e is NoSuchMethodError);
  Expect.throws(() { c2.s2 = 4; }, (e) => e is NoSuchMethodError);
}
