// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that specifying `void` as a function's parameter type
/// (without the parameter name) causes a compile-time error.
/// @author iefremov

main() {
  f(void) {};
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
