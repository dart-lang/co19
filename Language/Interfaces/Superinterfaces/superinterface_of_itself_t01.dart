// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an interface is a superinterface
/// of itself.
/// @description Checks that it is a compile-time error if a non-generic
/// interface is a superinterface of itself.
/// @author vasya


abstract class I implements I {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified

class A implements I {}
//    ^
// [cfe] unspecified

main() {
  new A();
}

