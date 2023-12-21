// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Cast pattern:
/// ...
/// Let S be the lifted space union of the cast's subpattern in context C.
/// i. If C is a subset (see below about type subsetting) of S then the result
///   spaces is the lifted space union of M.
/// ii. Otherwise, the result spaces is S plus the lifted space union of Null
///   when C is a non-nullable type, and spaces is S when C is potentially
///   nullable.
///
/// @description Check a lifted space of a cast pattern in case of a sealed type
/// @author sgrekhov22@gmail.com

sealed class A {}

class B extends A {}

class C extends A {}

int test1(A a) {
  switch (a) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case B() as C:
      return 0;
  }
}

int test2(A a) => switch (a) { B() as C => 0 };
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(test1);
  print(test2);
}
