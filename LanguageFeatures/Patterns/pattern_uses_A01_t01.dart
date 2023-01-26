// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// It is a compile-time error if the expression in a guard clause in a switch
/// case or if-case construct is not assignable to bool.
///
/// @description Check that it is a compile-time error if the expression in a
/// guard clause is not assignable to bool.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1(List<int> v) {
  switch (v) {
    case [var a, _] when a - 1:
//                       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "match";
    default:
      return "no match";
  }
}

String test2(List<int> v) {
  if (v case [var a, _] when a - 1) {
//                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "match";
  }
  return "no match";
}

String test3(List<int> v) =>
  switch (v) {
    [var a, _] when a - 1 => "match",
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "no match"
  };

main () {
  test1([1, 2]);
  test2([1, 2]);
  test3([1, 2]);
}
