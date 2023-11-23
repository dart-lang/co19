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
/// getters
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

external int get g0;

class C1 {
  external static int get g1;
  external int get g2;
}

mixin M {
  external static int get g1;
  external int get g2;
}

class C2 = Object with M;

main() {
  C1 c1 = C1();
  C2 c2 = C2();
  Expect.throws(() { int i = g0; }, (e) => e is NoSuchMethodError);
  Expect.throws(() { int i = C1.g1; }, (e) => e is NoSuchMethodError);
  Expect.throws(() { int i = c1.g2; }, (e) => e is NoSuchMethodError);
  Expect.throws(() { int i = M.g1; }, (e) => e is NoSuchMethodError);
  Expect.throws(() { int i = c2.g2; }, (e) => e is NoSuchMethodError);
}
