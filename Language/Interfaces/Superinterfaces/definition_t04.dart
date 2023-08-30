// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An interface has a set of direct superinterfaces.
/// An interface J is a superinterface of an interface I iff either J is a
/// direct superinterface of I or J is a superinterface of a direct
/// superinterface of I.
/// @description Checks that it is a compile-time error if the chain of
/// superinterfaces forms a circular dependency.
/// @author rodionov


abstract class A implements B {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified
abstract class B implements A {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified

class C implements B {}
//    ^
// [cfe] unspecified

main() {
  new B();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

