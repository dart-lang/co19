// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - No declaration in the augmentation chain specifies a default value for an
///   optional parameter whose declared type is potentially non-nullable, and
///   the constructor is not a redirecting factory.
///
/// @description Checks that it is a compile-time error if no declaration in the
/// augmentation chain specifies a default value for an optional parameter whose
/// declared type is potentially non-nullable, and the constructor is not a
/// redirecting factory. Test primary constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C1([int x]) {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment class C1 {
  augment C1.new([int x]);
}

class C2({int x}) {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment class C2 {
  augment C2({int x});
}

enum E1([int x]) {
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  e0(0);
}

augment enum E1 {
  ;
  augment const E1([int x]);
}

enum E2({int x}) {
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  e0(0);
}

augment enum E2 {
  ;
  augment const E2({int x});
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
}
