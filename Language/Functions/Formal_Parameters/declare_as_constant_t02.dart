// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a formal parameter is declared as
/// a constant variable.
/// @description Checks that it is a compile-time error if a required parameter
/// is declared as a constant typed variable.
/// @author msyabro


void f(const int x) {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified

main () {
  f(1);
}
