// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if the signature of the
/// constructor augmentation does not match the original constructor. Test wrong
/// number of positional parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C(int x);
}

augment class C {
  augment C();
//        ^
// [analyzer] unspecified
// [cfe] unspecified

  augment C(int x, int y);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(0);
  const E(int x);
}

augment enum E {
  augment e0;
  augment const E();
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  augment const E(int x, int y);
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {
  ET.foo(this.id);
}

augment extension type ET {
  augment ET.foo();
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.foo(int id, int y);
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
