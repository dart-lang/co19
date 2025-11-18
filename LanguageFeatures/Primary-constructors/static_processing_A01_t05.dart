// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` or `factory` as a keyword and omitting
/// the class name in declarations of ordinary (non-primary) constructors is
/// purely syntactic. The static analysis and meaning of such constructors is
/// identical to the form that uses the class name.
///
/// @description Check that it is a compile-time error if a `new` keyword is
/// used as a constructor name in the initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1 {
  C1();
  C1.someName() : new();
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  C2() : new.someName();
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  C2.someName();
}

extension type ET1(int v) {
  ET1.someName() : new(0);
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2.someName(int v) {
  ET2() : new.someName(0);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0;

  const E1();
  const E1.someName() : new();
//                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;

  const ET2() : new.someName();
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  const ET2.someName();
}

main() {
  print(C1);
  print(C2);
  print(ET1);
  print(ET2);
  print(E1);
  print(E2);
}
