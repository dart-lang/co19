// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function is always an instance of some class that implements the
/// class Function and implements a call method with the same signature as the
/// function. All function types are subtypes of Function.
/// @description Checks that various local functions implement the interface
/// Function.
/// @author iefremov

import "../../../Utils/expect.dart";

main() {
  f1() {}
  void f2() {}
  Object f3() => new Object();
  int f4() => 42;
  f5(var x) {}
  void f6(var x) {}
  String f7([var x]) => "Lily was here";
  Object f8(var x, int z, [Object? o, var v = 1]) => new Object();
  Object f9(var xx, int zz, {o, v: 1}) => new Object();

  Expect.isTrue(f1 is Function);
  Expect.isTrue(f2 is Function);
  Expect.isTrue(f3 is Function);
  Expect.isTrue(f4 is Function);
  Expect.isTrue(f5 is Function);
  Expect.isTrue(f6 is Function);
  Expect.isTrue(f7 is Function);
  Expect.isTrue(f8 is Function);
  Expect.isTrue(f9 is Function);
  checkType(checkIs<Function>, true, f1);
  checkType(checkIs<Function>, true, f2);
  checkType(checkIs<Function>, true, f3);
  checkType(checkIs<Function>, true, f4);
  checkType(checkIs<Function>, true, f5);
  checkType(checkIs<Function>, true, f6);
  checkType(checkIs<Function>, true, f7);
  checkType(checkIs<Function>, true, f8);
  checkType(checkIs<Function>, true, f9);
}
