// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The introductory constructor is `const` and the augmenting constructor is
///   not or vice versa.
///
/// @description Checks that it is a compile-time error if the augmenting
/// constructor is `const` and the introductory constructor is not.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C();
}

augment class C {
  augment const C();
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {
  ET.foo(this.id);
}

augment extension type ET {
  augment const ET.foo(this.id);
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
