// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// • An expression of the form e is T is potentially constant if e is a
///   potentially constant expression and T is a constant type expression, and
///   it is further constant if e is constant.
///
/// @description Checks that an expression of the form `e is T` is not a
/// constant expression if `e` is not a constant expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

class C {
  C();
}

extension type IntET1(int _) {}
extension type IntET2(int _) implements int {}

test<T>() {
  const c = T is Type;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  int i = 1;
  var d = 3.14;
  var c = C();

  const c1 = i is num;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  const c2 = (d as num) is double;
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  const c3 = IntET1(1) is int;
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c4 = IntET2(1) is int;
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c5 = (i,) is (int,);
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  const c6 = (IntET1(1),) is (int,);
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c7 = (IntET2(1),) is (int,);
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c8 = [i] is List<int>;
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  const c9 = [IntET1(1)] is List<int>;
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c10 = [IntET2(1)] is List<num>;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c11 = {d} is Set<num>;
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  const c12 = {IntET1(1)} is Set<num>;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c13 = {IntET2(1)} is Set<num>;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c14 = {IntET1(1): IntET1(2)} is Map<num, int>;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c15 = {IntET2(1): IntET2(2)} is Map<num, int>;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c16 = IntET1(1) is IntET2;
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c17 = IntET2(1) is IntET1;
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c19 = c is Object;
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}
