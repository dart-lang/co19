// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @description Regression test for the issue 34087 (Dartanalyzer does not throw
/// error when [Callable] function result is assigned to incorrect type).
/// Checks that compile error appears if [Callable] function result is assigned
/// to the variable of incorrect type.
/// @Issue 34087
/// @author iarkh@unipro.ru

class A<X> {}

class F {
  X call<X extends A<X>>() => null;
}

main() {
  F testme = F();

  A<A> a1 = testme();
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  A<A<A>> a2 = testme();
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  A<A<A<A>>> a3 = testme();
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  A<A<A<A<A>>>> a4 = testme();
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  A<A<A<A<A<A>>>>> a5 = testme();
//                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
