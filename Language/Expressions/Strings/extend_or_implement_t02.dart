// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error for a class to attempt to extend,
/// mix in or implement String.
/// @description Checks that it is a compile-time error for an interface to
/// attempt to extend String.
/// @author msyabro


abstract class I extends String {}
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
class C implements I {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
}
