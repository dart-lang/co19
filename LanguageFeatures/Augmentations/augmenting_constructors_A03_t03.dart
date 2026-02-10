// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The introductory constructor is `const` and the augmenting constructor is
///   not or vice versa.
///
/// @description Checks that it is a compile-time error if the introductory
/// constructor is `const` and the augmenting constructor is not. Test primary
/// constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class const C();

augment class C {
  augment C();
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET(int id);

augment extension type ET {
  augment ET(int id);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
