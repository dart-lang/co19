// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if a built-in identifier is used as
/// the declared name of a prefix, class, type parameter or type alias.
/// @description  Checks that when a built-in identifier is used in an identifier
/// reference, but since no declaration with that name can exist, lookup fails
/// eventually with the type of error depending on context. This test checks that
/// in a class instance scope, referencing a built-in identifier results in
/// a compile error
/// @author rodionov


class A {
  test() {
    abstract();
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 + as;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    1 << export;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    external ^ 0;
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 * factory;
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 >= get;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
    var x = implements;
//          ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 == import;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 == library;
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    operator.x;
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    1 == part;
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    --set;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    true && static;
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ++typedef;
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new A().test();
}
