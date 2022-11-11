// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// If the variable's name is _, it doesn't bind any variable. This "wildcard"
/// name is useful as a placeholder in places where you need a subpattern in
/// order to destructure later positional values:
/// ```dart
/// var list = [1, 2, 3];
/// var [_, two, _] = list;
/// ```
/// The `_` identifier can also be used with a type annotation when you want to
/// test a value's type but not bind the value to a name:
/// ```dart
/// switch (record) {
///   case (int _, String _):
///     print('First field is int and second is String.');
/// }
/// ```
/// @description Check that if variable name is _, it doesn't bind any variable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

test(Record r) {
  switch (r) {
    case (_, String s):
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case (_, {int i}):
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case (int _,):
      if (_ == 0) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var list = [1, 2];
  var [_, _a] = list;
  var map = {1: 2};
  var {1: _} = map;

  if (_ == 1) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  test(());
}
