// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The general rule is that compile-time errors apply to semantic
/// definitions whenever possible. In other words, if the library is
/// syntactically well-formed enough that augmentations can be applied, then
/// they should be. And if doing so eliminates what would otherwise be a
/// compile-time error, then that error should not be reported.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting generative constructor if the augmented constructor has
/// initialising formals.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x, y;
  C(this.x, [this.y = 0]);
  C.foo(this.x, {this.y = 0});
  C.bar({required this.y});
}

augment class C {
  augment C.foo(int x, {int y}) : this(x);
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.bar({required int y}) : this.foo(0);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(1, 2), e1.foo(3, y: 4), e2.bar(5, y: 6);
  final int x, y;
  const E(this.x, [this.y = 0]);
  const E.foo(this.x, {this.y = 0});
  const E.bar(this.x, {required this.y});
}

augment enum E {
  augment e0;
  augment const E.foo(int x, {int y}) : this(x);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.bar(int x, {required int y}) : this.foo(0);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  ET.foo(this.x);
  ET.bar({required this.x});
}

augment extension type ET {
  augment ET.foo(int x) : this(0);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.bar({required int x}) : this.new(1);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
