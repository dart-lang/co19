// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion nullCheckPattern ::= primaryPattern '?'
///
/// A null-check pattern matches if the value is not null, and then matches the
/// inner pattern against that same value. Because of how type inference flows
/// through patterns, this also provides a terse way to bind a variable whose
/// type is the non-nullable base type of the nullable value being matched:
///
/// @description Check that it is a static warning if the matched value of a
/// null-check pattern cannot be null
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1(int? x) {
  switch (x) {
    case int? v1 || int? v1?:
//                         ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
// [cfe] The null-check pattern will have no effect because the matched type isn't nullable.
      return "match-1";
    case int v2?:
//             ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
// [cfe] The null-check pattern will have no effect because the matched type isn't nullable.
      return "match-2";
    default:
      return "no match";
  }
}

String test2(int? x) {
  if (x case int? v1 || int? v1?)
//                             ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
// [cfe] The null-check pattern will have no effect because the matched type isn't nullable.
    return "match-2";
  if (x case int v2?)
//                 ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
// [cfe] The null-check pattern will have no effect because the matched type isn't nullable.
    return "match-2";
  return "no match";
}

String test3(int? x) =>
  switch (x) {
    final int? v1 || final int? v1? => "match-1",
//                                ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
// [cfe] The null-check pattern will have no effect because the matched type isn't nullable.
    int v2? => "match-2",
//        ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NULL_CHECK_PATTERN
// [cfe] The null-check pattern will have no effect because the matched type isn't nullable.
    _ => "no match"
  };

main () {
  test1(1);
  test2(1);
  test3(1);
}
