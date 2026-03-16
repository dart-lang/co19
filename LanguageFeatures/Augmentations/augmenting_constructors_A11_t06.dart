// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Check that it is a compile-time error if a `new` keyword is
/// used as a constructor name in the initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

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
