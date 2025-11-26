// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation is complete and any
/// declaration before it in the augmentation chain is also complete.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting generative constructor if the augmented constructor has a super
/// initializer.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class A {
  int x;
  A(this.x);
}

class C extends A {
  C() : super(0);
  C.foo() : super(0);
}

augment class C {
  augment C.foo(): this();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
