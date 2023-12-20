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
/// type. Test switch element
/// @author sgrekhov22@gmail.com
/// @issue 51986

// Switch statement is exhaustive in this case but switch expression isn't. It's
// expected. For details see
// https://github.com/dart-lang/sdk/issues/51986#issuecomment-1864237801
int test(Object obj) => switch (obj) {
//                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    int(isEven: true) as int => 1,
    int _ => 2
  };

main() {
  print(test);
}
