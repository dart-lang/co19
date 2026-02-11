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

class const C1();

augment class C1 {
  augment C1();
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C2(final int x);

augment class C2 {
  augment C2(int x);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1() {
  e0;
}

augment enum E1 {
  ;
  augment E1();
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2(final int x) {
  e0(0);
}

augment enum E2 {
  ;
  augment E2(int x);
//        ^^
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
  print(C1);
  print(C2);
  print(E1);
  print(E2);
  print(ET);
}
