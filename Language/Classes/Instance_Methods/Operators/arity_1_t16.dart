// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the arity of a user-declared 
/// operator with one of the names:
/// <, >, <=, >=, ==, -, +,  ̃/, /, *, %, |, ˆ, &, <<, >>, >>>, [] is not 1.
///
/// @description Checks that a compile-time error is produced if a user-defined
/// operator [] specifies no parameters.
/// @author iefremov

class C {
  operator []() {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C()[0];
}
