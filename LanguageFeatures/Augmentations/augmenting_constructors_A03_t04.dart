// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The introductory constructor is `const` and the augmenting constructor is
///   not or vice versa.
///
/// @description Checks that it is a compile-time error if the augmenting
/// constructor is `const` and the introductory constructor is not. Test primary
/// constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C();

augment class C {
  augment const C();
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id);

augment extension type ET {
  augment const ET(this.id);
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
