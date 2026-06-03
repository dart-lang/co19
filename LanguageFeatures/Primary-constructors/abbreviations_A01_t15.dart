// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that it is still a compile-time error to use keyword
/// `new` as a redirection target.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1 {
  C1();
  C1.other() : new();
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  C2.name();
  C2() : new name();
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0;

  const E1();
  const E1.other() : new();
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;

  const E2.name();
  const E2() : new name();
//             ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1.name(int _) {
  ET1() : new name(0);
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int _) {
  ET2.name() : new(0);
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
  print(ET1);
  print(ET2);
}
