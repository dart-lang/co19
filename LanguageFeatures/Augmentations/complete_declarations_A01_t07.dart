// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation is complete and any
/// declaration before it in the augmentation chain is also complete.
///
/// @description Checks that it is a compile-time error if a redirecting
/// factory constructor augments a factory constructor which is not potentially
/// redirecting.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C();
  factory C.foo() => C();
}

augment class C {
  augment factory C.foo() = C;
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {
  ET.foo(this.id);
  factory ET.bar(int id) => ET.foo(id);
}

augment extension type ET {
  augment factory ET.bar(int id) = ET.foo;
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
