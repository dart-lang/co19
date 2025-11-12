// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if a constructor
/// augmentation specifies a type of formal parameter which were not explicitly
/// specified in the introductory constructor and this type is not `dynamic`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x;
  C(x);
  C.foo({x});
  C.bar([x]);
  C.baz({required x});
}

augment class C {
  augment C(int this.x);
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment C.foo({this.x = 0});
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment C.bar([int x = 0]) : x = x;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment C.baz({required int x}) : x = x;
//                        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(1), e1.foo(x: 1), e2.bar(1), e3.baz(x: 1);
  final int x;
  const E(x);
  const E.foo({x});
  const E.bar([x]);
  const E.baz({required x});
}

augment enum E {
  ;
  augment const E(int this.x);
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo({this.x = 0});
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.bar([int x = 0]) : x = x;
//                     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.baz({required int x}) : x = x;
//                              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  ET.foo(x);
  ET.bar({x});
  ET.baz([x]);
  ET.qux({required x});
}

augment extension type ET {
  augment ET.foo(int this.x);
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment ET.bar({this.x = 0});
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment ET.baz([int x = 0]) : x = x;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment ET.qux({required int x}) : x = x;
//                         ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
