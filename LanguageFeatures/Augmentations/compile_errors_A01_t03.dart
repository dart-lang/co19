// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The general rule is that compile-time errors apply to semantic
/// definitions whenever possible. In other words, if the library is
/// syntactically well-formed enough that augmentations can be applied, then
/// they should be. And if doing so eliminates what would otherwise be a
/// compile-time error, then that error should not be reported.
///
/// @description Checks that it is still a compile-time error if the augmenting
/// constructor has a super-initializer not at the last position in the
/// initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

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
