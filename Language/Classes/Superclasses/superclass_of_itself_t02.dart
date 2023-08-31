// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a class C is a superclass of itself
///
/// @description Checks that it is a compile-time error if a class attempts to
/// extend itself indirectly, by transition.
/// @author msyabro

class A extends D {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified
class B extends A {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified
class C extends B {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified
class D extends C {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new A();
}
