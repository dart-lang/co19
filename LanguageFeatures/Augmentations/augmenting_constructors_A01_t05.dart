// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if the signature of the
/// constructor augmentation does not match the original constructor. Test wrong
/// optionality of parameters in an augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C(int? x);
  C.foo([int? y = 0]);
  C.bar({int? z = 0});
  C.baz({required int? v});
}

augment class C {
  augment C([int? x]);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo(int? y);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.bar({required int? z});
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.baz({int? v});
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(0);
  const E(int? x);
  const E.foo([int? y = 0]);
  const E.bar({int? z = 0});
  const E.baz({required int? v});
}

augment enum E {
  ;
  augment const E([int? x]);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo(int? y);
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.bar({required int? z});
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.baz({int? v});
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int? id) {
  ET.foo(int? x): this.id = 0;
  ET.bar([int? y = 0]): this.id = 0;
  ET.baz({int? z = 0}): this.id = 0;
  ET.qux({required int? v}): this.id = 0;
}

augment extension type ET {
  augment ET.foo([int? x]);
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.bar(int? y);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.baz({required int? z});
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.qux({int? v});
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
