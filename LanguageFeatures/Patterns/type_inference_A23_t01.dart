// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Null-check or null-assert:
//
// Let N be NonNull(M).
//
// Type-check the subpattern using N as the matched value type.
///
/// @description Check that it is a compile-time error if type-check of the
/// subpattern, using `N` as the matched value type, fails in an irrefutable
/// context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

main() {
  final (int x1!) = "42";
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

  String? s = null;
  final (int? y1!) = s;
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

  int x2 = 0;
  (x2!) = "42";
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int? y2;
  (y2!) = s;
// ^^
// [analyzer] unspecified
// [cfe] unspecified
}
