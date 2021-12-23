// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function is always an instance of some class that implements the
/// class Function and implements a call method with the same signature as the
/// function. All function types are subtypes of Function.
/// @description Checks that function literals implement the interface Function.
/// @author iefremov

import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(() {} is Function);
  Expect.runtimeIsType<Function>(() {});
  Expect.isTrue((var x) {} is Function);
  Expect.runtimeIsType<Function>((var x) {});

  Expect.isTrue(((var x) => null) is Function);
  Expect.runtimeIsType<Function>((var x) => null);
  Expect.isTrue(((int x) => x) is Function);
  Expect.runtimeIsType<Function>(((int x) => x));
  Expect.isTrue((([var x]) => "aa") is Function);
  Expect.runtimeIsType<Function>(([var x]) => "aa");
  Expect.isTrue(
      ((var x, int z, [Object? o, var v = 1]) => x + z + o + v) is Function);
  Expect.runtimeIsType<Function>(
      ((var x, int z, [Object? o, var v = 1]) => x + z + o + v));
  Expect.isTrue(((x, z, {o, v: 1}) => x + z + o + v) is Function);
  Expect.runtimeIsType<Function>(((x, z, {o, v: 1}) => x + z + o + v));
}
