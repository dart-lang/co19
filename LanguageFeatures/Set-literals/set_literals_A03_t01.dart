// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let T be the explicit or inferred type argument to the type
/// literal. It's a compile-time error if the static type of any element
/// expression is not assignable to T.
///
/// @description Checks that it's a compile-time error if the static type of any
/// element expression is not assignable to T
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
  var v1 = const <int>{1, '2', 3};
//                        ^^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'String' can't be assigned to a variable of type 'int'.
  var v2 = <int>{1, '2', 3};
//                  ^^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'String' can't be assigned to a variable of type 'int'.
  var v3 = <B>{new B(), new C(), new A()};
//                               ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
//                                 ^
// [cfe] A value of type 'A' can't be assigned to a variable of type 'B'.
  var v4 = const <B>{const B(), const C(), const A()};
//                                         ^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
//                                             ^
// [cfe] A value of type 'A' can't be assigned to a variable of type 'B'.
}
