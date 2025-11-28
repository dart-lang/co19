// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The general rule is that compile-time errors apply to semantic
/// definitions whenever possible. In other words, if the library is
/// syntactically well-formed enough that augmentations can be applied, then
/// they should be. And if doing so eliminates what would otherwise be a
/// compile-time error, then that error should not be reported.
///
/// @description Checks that it is a compile-time error if the augmenting
/// factory constructor indirectly references itself.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  factory C();
  factory C.foo();
  factory C.bar();
}

augment class C {
  augment factory C() = C.bar;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.foo() = C;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.bar() = C.foo;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  factory ET.foo(int x);
  factory ET.bar(int x);
}

augment extension type ET {
  augment factory ET(int x) = ET.bar;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory ET.foo(int x) = ET;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory ET.bar(int x) = ET.foo;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
