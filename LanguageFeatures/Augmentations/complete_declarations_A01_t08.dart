// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation is complete and any
/// declaration before it in the augmentation chain is also complete.
///
/// @description Checks that it is a compile-time error to add a body to an
/// already completed declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1 {
  C1() {}
}

augment class C1 {
  augment C1() {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  C2() {}
}

augment class C2 {
  augment C2.new() {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 {
  C3.new() {}
}

augment class C3 {
  augment C3() {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1._(int id) {
  ET1(this.id) {}
  ET1.foo(this.id) {}
}

augment extension type ET1 {
  augment ET1(this.id) {}
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET1.foo(this.id) {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2._(int id) {
  ET2.new(this.id) {}
}

augment extension type ET2 {
  augment ET2(this.id) {}
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3._(int id) {
  ET3(this.id) {}
}

augment extension type ET3 {
  augment ET3(this.id) {}
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(ET1);
  print(ET2);
  print(ET3);
}
