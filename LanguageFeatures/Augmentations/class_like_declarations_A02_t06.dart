// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class marked `augment` has a
/// primary constructor (`primaryConstructor`) or contains a primary constructor
/// initializer block (`primaryConstructorBodySignature`).
///
/// @description Check that it is a compile-time error if a class, enum or mixin
/// class marked `augment` has a primary constructor, even if the introductory
/// declaration does not have one.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1 {}

augment class C1() {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C2 {}

augment class C2(int v) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C3 {}

augment class C3(var int v) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C4 {}

augment class C4.someName(final int v) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

enum E {
  e0;
}

augment enum E([final int v = 0]) {
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

mixin class M {}

augment mixin class M() {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(E);
  print(M);
}
