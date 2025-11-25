// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation is complete and any
/// declaration before it in the augmentation chain is also complete.
///
/// @description Checks that it is a compile-time error if a redirecting
/// constructor augments a constructor which is not potentially redirecting.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x;
  C(this.x);
  C.foo(): x = 1;
}

augment class C {
  augment C.foo(): this(0);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(0);
  final int x;
  const E(this.x);
  const E.foo(): x = 1;
}

augment enum E {
  augment const E.foo(): this(0);
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET._(int x) {
  const ET(this.x);
  const ET.foo(): x = 1;
}

augment extension type ET {
  augment const ET.foo(): this(0);
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
main() {
  print(C);
  print(E);
  print(ET);
}
