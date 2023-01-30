// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion nullAssertPattern ::= primaryPattern '!'
///
/// A null-assert pattern is similar to a null-check pattern in that it permits
/// non-null values to flow through. But a null-assert throws if the matched
/// value is null. It lets you forcibly assert that you know a value shouldn't
/// be null, much like the corresponding ! null-assert expression.
///
/// @description Check that it is a static warning if the matched value of a
/// null-assert pattern cannot be null
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1(int? x) {
  switch (x) {
    case final int? v1! || final int? v1!:
//                                      ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_ASSERT_PATTERN
// [cfe] The null-assert pattern will have no effect because the matched type isn't nullable.
      return "match-1";
    case int? v2 || int? v2!:
//                         ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_ASSERT_PATTERN
// [cfe] The null-assert pattern will have no effect because the matched type isn't nullable.
      return "match-2";
    case int v3!:
      return "match-3";
    default:
      return "no match";
  }
}

String test2(int? x) {
  if (x case final int? v1! || final int? v1!)
//                                          ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_ASSERT_PATTERN
// [cfe] The null-assert pattern will have no effect because the matched type isn't nullable.
    return "match-1";
  if (x case int? v2 || int? v2!)
//                             ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_ASSERT_PATTERN
// [cfe] The null-assert pattern will have no effect because the matched type isn't nullable.
    return "match-2";
  if (x case int v3!)
    return "match-3";
  return "no match";
}

String test3(int? x) =>
  switch (x) {
    final int? v1! || final int? v1! => "match-1",
//                                 ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_ASSERT_PATTERN
// [cfe] The null-assert pattern will have no effect because the matched type isn't nullable.
    final int? v2 || final int? v2! => "match-2",
//                                ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_ASSERT_PATTERN
// [cfe] The null-assert pattern will have no effect because the matched type isn't nullable.
    int v3! => "match-2",
    _ => "no match"
  };

main () {
  test1(1);
  test2(1);
  test3(1);
}
