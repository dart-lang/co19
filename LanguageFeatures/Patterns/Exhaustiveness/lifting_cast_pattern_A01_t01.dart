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
///     space union of E.
///
/// @description Check a lifted space of a cast pattern in case of not sealed
/// type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

int test1(Object obj) {
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (obj) {
    case int(isEven: true) as int:
      return 1;
    case int _:
      return 2;
  }
}

int test2(Object obj) => switch (obj) {
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    int(isEven: true) as int => 1,
    int _ => 2
  };

main() {
  test1(1);
  test2(2);
}
