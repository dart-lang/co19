// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion There are no other constant expressions.
/// @description Checks that a property extraction expression cannot be used to
/// initialize a constant variable.
/// @author iefremov


class A {
  const A();
  m() {}
}

final a = const A();
const m = a.m;
//        ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  try {
    print(m);
  } catch (x) {}
}
