// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function value, or an instance of a class with a "call" method, 
/// is a subtype of a function type, and as such, a subtype of Function.
/// @description Checks that function object is an instance of a class which is a
/// subtype of [Function] and has a [call] method.
/// @author iarkh

import "../../../Utils/expect.dart";

int foo(String s) {
  return 21;
}

main() {
  Expect.equals(21, foo.call("testme"));
  Expect.equals(1, (int, double) { return 1; } (1, 3.14));
  Expect.equals(1, (()  => 1)());
}
