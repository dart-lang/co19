// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function value, or an instance of a class with a "call" method, 
/// is a subtype of a function type, and as such, a subtype of Function.
/// @description Checks that function values are indeed subtypes of the
/// [Function] class.
/// @author rodionov

import "../../../Utils/expect.dart";

int foo(String s) {
  return 21;
}

int foo1() => 1;

main() {
  Expect.isTrue(foo is Function);
  Expect.isTrue(foo1 is Function);
  Expect.isTrue((int, double) { return 1; } is Function);
  Expect.isTrue((()  => 1) is Function);
  Expect.runtimeIsType<Function>(foo);
  Expect.runtimeIsType<Function>(foo1);
  Expect.runtimeIsType<Function>((int, double) { return 1; });
  Expect.runtimeIsType<Function>((()  => 1));
}
