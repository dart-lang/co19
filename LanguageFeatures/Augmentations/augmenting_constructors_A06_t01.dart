// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The general rule is that compile-time errors apply to semantic
/// definitions whenever possible. In other words, if the library is
/// syntactically well-formed enough that augmentations can be applied, then
/// they should be. And if doing so eliminates what would otherwise be a
/// compile-time error, then that error should not be reported.
///
/// @description Checks that it is a compile-time error if the resulting
/// constructor has a redirecting initializer and initializer list elements.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x;
  C(this.x);
  C.foo() : this(0);
}

augment class C {
  augment C.foo() : x = 1;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0.foo();
  final int x;
  const E(this.x);
  const E.foo() : this(0);
}

augment enum E {
  augment const E.foo() : x = 1;
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int v) {
  ET.foo() : this(0);
}

augment extension type ET {
  augment ET.foo() : x = 1;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
