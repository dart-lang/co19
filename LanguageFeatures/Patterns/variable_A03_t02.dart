// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// variablePattern ::= ( 'var' | 'final' | 'final'? type )? identifier
///
/// A variable pattern binds the matched value to a new variable. These usually
/// occur as subpatterns of a destructuring pattern in order to capture a
/// destructured value.
/// ```dart
/// var (a, b) = (1, 2);
/// ```
/// Here, a and b are variable patterns and end up bound to 1 and 2,
/// respectively.
///
/// The pattern may have a type annotation in order to only match values of the
/// specified type. If the type annotation is omitted, the variable's type is
/// inferred and the pattern matches all values.
/// ```dart
/// switch (record) {
///   case (int x, String s):
///     print('First field is int $x and second is String $s.');
/// }
/// ```
/// @description Check that if variable in a variable pattern is declared final
/// then it is a compile-time error to assign a value to it. Test records
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

void test1(Record r) {
  switch (r) {
    case (final a, name: final b):
      a = 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
      b = 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case (final int c, final String d):
      c = 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
      d = "";
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    break;
    case (final int? e, name: final String? f):
      e = 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
      f = "";
//    ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
  }
}

Object? test2(Record r) {
  return switch (r) {
    (final a,) => a = 1,
//                ^
// [analyzer] unspecified
// [cfe] unspecified
    (final a, name: final b) => b = 1,
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
    (final int c,) => c = 1,
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
    (final int c, final String d) =>  d = "",
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
    (final int? e,) => e = 1,
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
    (final int? e, name: final String? f) => f = "",
//                                           ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => ""
  };
}

void test3(Record r) {
  if (r case (final a, name: final b)) {
    a = 1;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    b = 1;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (r case (final int c, final String d)) {
    c = 1;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    d = "";
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (r case (final int? e, name: final String? f)) {
    e = 1;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    f = "";
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}


main() {
  test1(());
  test2(());
  test3(());
}
