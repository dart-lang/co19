// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that at type `T` is a type of interest for a variable `x`
/// in a set of tested types `tested` if `tested` contains a type `S` such that
/// `T` is `S`, or `T` is `NonNull(S)`.
///
/// @description Checks that if `T` is a type of interest for a variable `x`,
/// then it doesn't make `T?` a type of interest for `x`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int foo() => 42;
}

test(S? s) {
  if (s is T) {}
  s = 1 > 2 ? null: T(); // assign `T?` to `s`
  s?.foo();
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
