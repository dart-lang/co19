// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function value, or an instance of a class with a "call" method, 
/// is a subtype of a function type, and as such, a subtype of Function.
/// @description Now it is not sufficient for a class to have a [call] method,
/// since Dart 2 no user-written class is a subtype of [Function]. But every
/// function object (that is, the result of evaluating a function literal or
/// tearing off a function or method) is an instance of a class which is a
/// subtype of [Function].
/// Created https://dart-review.googlesource.com/154004 to get that fixed.
/// So the test checks that class with [call] method is not a subtype of [Function].
/// @author iarkh

import "../../../Utils/expect.dart";

class A {
  int call(int x, bool y) => 1;
}

class B extends A {}

main() {
  Expect.isFalse(new A() is Function);
  Expect.isFalse(new B() is Function);
}
