// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if the signature of the
/// constructor augmentation does not match the original constructor. Test wrong
/// names of named parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C({int x = 0});
}

augment class C {
  augment C({int y});
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  const E({int x = 0});
}

augment enum E {
  ;
  augment const E({int y});
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {
  ET.baz({int x = 0}): this.id = 0;
}

augment extension type ET {
  augment ET.baz({int y});
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
