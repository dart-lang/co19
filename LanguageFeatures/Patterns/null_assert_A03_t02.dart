// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
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

String test1(int? value) =>
  switch (value) {
    var a1! when a1 > 0 => "null-assert-1",
    var a2! => "null-assert-2",
//        ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_ASSERT_PATTERN
// [cfe] The null-assert pattern will have no effect because the matched type isn't nullable.
    _ => "default"
  };

String test2(int? value) {
  switch (value) {
    case var a1! when a1 > 0:
      return "null-assert-1";
    case var a2!:
//             ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_ASSERT_PATTERN
// [cfe] The null-assert pattern will have no effect because the matched type isn't nullable.
      return "null-assert-2";
    default:
      return "default";
  }
}

String test3(int? value) {
  switch (value) {
    case var _! when value == 0:
      return "null-assert-1";
    case var _! when value == 42:
//            ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_ASSERT_PATTERN
// [cfe] The null-assert pattern will have no effect because the matched type isn't nullable.
      return "null-assert-2";
    default:
      return "default";
  }
}

main() {
  test1(1);
  test2(1);
  test3(1);
}
