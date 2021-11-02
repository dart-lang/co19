// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If s starts with const, then it is a compile-time error if any
/// element expression is not a compile-time constant expression, or if T is not
/// a compile-time constant type.
///
/// @description Checks that it's a compile-time error if there is an
/// element expression which is not a compile-time constant expression
/// @author sgrekhov@unipro.ru

class A {
  const A();
}
class B extends A {
  const B();
}
class C extends B {
  const C();
}

main() {
  var x;
  var v1 = const {1, 2, '3', new A()};
  //                         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var v2 = const [const B(), const C(), const A(), x];
  //                                               ^
  // [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
  // [cfe] Not a constant expression.
  const v3 = {1, 2, '3', new A()};
//                       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const v4 = [const B(), const C(), const A(), x];
//                                             ^
// [analyzer] unspecified
// [cfe] unspecified
}
