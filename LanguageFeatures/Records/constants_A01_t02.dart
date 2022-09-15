// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Record expressions can be constant and potentially constant
/// expressions. A record expression is a compile-time constant expression if
/// and only if all its field expressions are compile-time constant expressions.
///
/// *This is true whether the expression occurs in a constant context or not,
/// which means that a record expression can be used directly as a parameter
/// default value if its record field expressions are constant expressions, as
/// in:
/// ```dart
/// void someFunction({(int, int) x = (1, 2)}) => ...`
/// ```
///
/// @description Checks that a record expression is not a compile-time constant
/// expression if any of the field expressions is not a compile-time
/// constant expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

final Pi = 3.14;

const r1 = (1, [1], {2}, {"a": 0}, Pi);
//                                 ^^
// [analyzer] unspecified
// [cfe] unspecified

const r2 = (l: [0], s: {1}, m: {"x": Pi});
//                                   ^^
// [analyzer] unspecified
// [cfe] unspecified

const r3 = (3.14, [Pi], {9}, m: {"a": 0});
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified

void f1([(int, List<int>, Set<int>, Map<String, int>, {String n}) v =
    const (n: "", 1, [1], {Pi}, {"a": 0},)]) {}
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified

void f2({(int, List<int>, Set<int>, Map<String, int>, {String n}) v =
    (n: "", 1, [Pi], {2}, {"a": 0},)}) {}
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

void f3([(int, List<int>, Set<int>, Map<String, int>, {String n}) v =
    (n: "", 1, [1], const {Pi}, const {"a": 0},)]) {}
//  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void f4({(int, List<int>, Set<int>, Map<String, int>, {String n}) v =
    (n: "", 1, const [42], {2}, const {"a": 0},)}) {}
//  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void f5([(int, List<int>, Set<int>, Map<String, int>, {String n}) v =
    (n: "", 1, const [1], const {Pi}, {"a": 0},)]) {}
//  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void f6({(num, List<int>, Set<int>, Map<String, int>, {String n}) v =
    (n: "", Pi, const [42], const {2}, const {"a": 0},)}) {}
//  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  f1();
  f2();
  f3();
  f4();
  f5();
  f6();
}
