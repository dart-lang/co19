// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting a constructor works similarly to augmenting a function,
/// with some extra rules to handle features unique to constructors, like
/// redirections and initializer lists, and the primary constructor syntax.
///
/// @description Check that it is a compile-time error if a `new` keyword is
/// used as a constructor name in the initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C();
  C.someName();
}

augment class C {
  augment C.someName() : new();
//                       ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int v) {
  ET.someName();
//^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.someName() : new(0);
//                        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  const E();
  const E.someName();
}

augment enum E {
  ;
  augment const E.someName() : new();
//                             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
  print(E);
}
