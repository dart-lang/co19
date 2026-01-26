// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation is complete and any
/// declaration before it in the augmentation chain is also complete.
///
/// @description Checks that it is a compile-time error if an introductory
/// factory constructor already has a redirection.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x, y;
  C(this.x, [this.y = 0]);
  C.foo(this.x, {this.y = 0});
  factory C.bar(int x, [int y]) = D;
  factory C.baz(int x, {int y}) = C.foo;
  factory C.qux(int x, [int y]) = C;
}

class D extends C {
  D(super.x, [super.y = 0]);
}

augment class C {
  augment factory C.bar(int x, [int y]) = C;
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.baz(int x, {int y}) = C.foo;
//                                        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.qux(int x, [int y]) = D;
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  ET.foo(this.x);
  factory ET.bar(int x) = ET;
  factory ET.baz(int x) = ET.foo;
}

augment extension type ET {
  augment factory ET.bar(int x) = ET;
//                                ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory ET.baz(int x) = ET.foo;
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
