// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// ...
///   - Add initializers (and/or asserts) to the initializer list, as well as a
///     `super`  call at the end of the initializer list.
///
/// @description Checks that it is a compile-time error if the augmented
/// constructor has a super-initializer, and the augmenting constructor's
/// initializer list also contains a super-initializer.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class A {
  int x;
  A(this.x);
}

class C extends A {
  int y;
  int z;
  C(int x, int y): this.y = y, super(x);
}

augment class C {
  augment C(int x, int y): z = 1, super(x);
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
