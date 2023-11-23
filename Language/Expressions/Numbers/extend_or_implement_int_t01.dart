// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error for a class to attempt to extend,
/// mix in or implement int
/// @description Checks that a user-defined class cannot extend int.
/// @author iefremov


class A extends int {}
//              ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new A();
}
