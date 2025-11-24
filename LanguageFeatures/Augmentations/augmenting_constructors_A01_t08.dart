// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if parameter names of
/// the constructor augmentation does not match the original constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class A1 {
  A1(int x, int y);
}

class C1 extends A1 {
  C1(super.x, super.y);
  C1.foo([super.x = 1, super.y = 1]);
}

augment class C1 {
  augment C1(int y, int x);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C1.foo([int y, int x]);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A2 {
  A2({int x = 0});
}

class C2 extends A2 {
  C2({super.x = 1});
  C2.foo({required super.x});
}

augment class C2 {
  augment C2({int y});
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C2.foo({int y});
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
}
