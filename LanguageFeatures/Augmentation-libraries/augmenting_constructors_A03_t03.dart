// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The introductory constructor is `const` and the augmenting constructor is
///   not or vice versa.
///
/// @description Checks that it is a compile-time error if the introductory
/// constructor is `const` and the augmenting constructor is not. Test factory
/// constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class C {
  const C();
  const factory C.foo() = C;
}

augment class C {
  augment factory C.foo();
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {
  const ET.foo(this.id);
  const factory ET.bar(int id) = ET.foo;
}

augment extension type ET {
  augment factory ET.bar(int id);
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
