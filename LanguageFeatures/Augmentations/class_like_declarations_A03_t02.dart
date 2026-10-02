// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class marked `augment` has a
/// primary constructor (`primaryConstructor`) or contains a primary constructor
/// initializer block (`primaryConstructorBodySignature`).
///
/// @description Check that it is a syntax error to augment a primary
/// constructor initializer block (`primaryConstructorBodySignature`).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1(var int _) {
  this {}
  augment this;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(final int _) {
  this;
  augment this {}
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E(final int v) {
  e0(0);
  this;
  augment this;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}


extension type ET1(int _) {
  this {}
  augment this;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int _) {
  this;
  augment this {}
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(E);
  print(ET1);
  print(ET2);
}
