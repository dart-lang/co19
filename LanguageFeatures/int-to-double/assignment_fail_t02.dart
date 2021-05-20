// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of a double valued integer literal is [double]
/// @description Checks that the static type of a double valued integer literal
/// is [double]. Test that it is a compile error if int is not assignable to type
/// X with extends [double]
/// @author sgrekhov@unipro.ru

class C<X extends double> {
  X x1 = 42;
//       ^^
// [analyzer] unspecified
// [cfe] unspecified
  X x = 0x42;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C<double>();
}
