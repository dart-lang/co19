// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation is complete and any
/// declaration before it in the augmentation chain is also complete.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting generative constructor more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x;
  C(this.x);
  C.foo(int x);
}

augment class C {
  augment C.foo(int x) : this(x + 1);
  augment C.foo(int x) : this(x + 2);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(0), e1.foo(1);
  final int x;
  const E(this.x);
  const E.foo(int x);
}

augment enum E {
  augment e0;
  augment const E.foo(int x) : this(x + 1);
  augment const E.foo(int x) : this(x + 2);
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  ET.foo(int x);
}

augment extension type ET {
  augment ET.foo(int x) : this(x + 1);
  augment ET.foo(int x) : this(x + 2);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
