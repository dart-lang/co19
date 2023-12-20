// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Cast pattern:
/// The space union spaces for a cast pattern with cast type C is a union of:
/// - The lifted space union of the cast's subpattern in context C.
/// - For each space E in the expanded spaces of M:
///   a. If E is not a subset of C and C is not a subset of M, then the lifted
///   space union of E.
///
/// @description Check a lifted space of a cast pattern in case of a not sealed
/// type
/// @author sgrekhov22@gmail.com

class A {}

class B extends A {}

class C extends A {}

test1(A a) {
  switch (a) {
    case B() as C:
      return 0;
  }
}

test2(A a) => switch (a) { B() as C => 0 };
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(test1);
  print(test2);
}
