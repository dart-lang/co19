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
  Expect.runtimeIsType<Function>(f1);
  Expect.runtimeIsType<Function>(f2);
  Expect.runtimeIsType<Function>(f3);
  Expect.runtimeIsType<Function>(f4);
  Expect.runtimeIsType<Function>(f5);
  Expect.runtimeIsType<Function>(f6);
  Expect.runtimeIsType<Function>(f7);
  Expect.runtimeIsType<Function>(f8);
  Expect.runtimeIsType<Function>(f9);
}
