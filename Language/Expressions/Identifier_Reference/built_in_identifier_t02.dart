// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_METHOD
// [cfe] The method 'abstract' isn't defined for the class 'A'.
    1 + as;
//      ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'as' isn't defined for the class 'A'.
    1 << export;
//       ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'export' isn't defined for the class 'A'.
    external ^ 0;
//  ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'external' isn't defined for the class 'A'.
    1 * factory;
//      ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'factory' isn't defined for the class 'A'.
    1 >= get;
//       ^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'get' isn't defined for the class 'A'.
    var x = implements;
//          ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'implements' isn't defined for the class 'A'.
    1 == import;
//       ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'import' isn't defined for the class 'A'.
    1 == library;
//       ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'library' isn't defined for the class 'A'.
    operator.x;
//  ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'operator' isn't defined for the class 'A'.
    1 == part;
//       ^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'part' isn't defined for the class 'A'.
    --set;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    true && static;
//          ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'static' isn't defined for the class 'A'.
    ++typedef;
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new A().test();
}
