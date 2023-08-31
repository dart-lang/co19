// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error for a class to
/// attempt to extend, mix in or implement Null.
/// @description Checks that Null cannot be extended by a class.
/// @author hlodvig


class A extends Null {}
//              ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  A();
}
