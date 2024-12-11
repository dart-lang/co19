// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// ...
///   - Add initializers (and/or asserts) to the initializer list, as well as a
///     `super`  call at the end of the initializer list.
///
/// @description Checks that it is still a compile-time error if the augmenting
/// constructor has a super-initializer not at the last position in the
/// initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class A {
  int x;
  A([this.x = 0]);
}

class C extends A {
  C(int x);
}

augment class C {
  augment C(int x): super(x), assert(x > 0);
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
