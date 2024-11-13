// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that specifying `void` on the right side of an `is`
/// expression causes a compile-time error.
/// @author iefremov

main() {
  bool b = null is void;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}
