// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Check that it is a compile-time error if a `new` keyword is
/// used as a constructor name in the factory constructor redirection.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C1 {
  C1();
  factory C1.someName();
}

augment class C1 {
  augment factory C1.someName() = new;
//                                ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  C2.someName();
  factory C2();
}

augment class C2 {
  augment factory C2() = new.someName;
//                       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  C2.someName();
}

extension type ET1._(int v) {
  ET1(this.v);
  factory ET1.someName(int v);
}

augment extension type ET1 {
  augment factory ET1.someName(int v) = new;
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2._(int v) {
  ET2.someName(this.v);
  factory ET2(int v) = new.someName;
}

augment extension type ET2 {
  augment factory ET2(int v) = new.someName;
//                             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(ET1);
  print(ET2);
}
