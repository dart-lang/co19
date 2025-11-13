// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` or `factory` as a keyword and omitting
/// the class name in declarations of ordinary (non-primary) constructors is
/// purely syntactic. The static analysis and meaning of such constructors is
/// identical to the form that uses the class name.
///
/// @description Check that it is a compile-time error if a `factory` keyword is
/// used as a constructor name in the factory constructor redirection.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class C1 {
  C1.create();
  factory C1() = C1.create;
  factory C1.someName() = factory;
//                        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  C2();
  factory C2.create() = C2;
  factory C2.someName2() = factory.create;
//                         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1.create(int v) {
  factory ET1(int v) = ET1.create;
  factory ET1.someName(int v) = factory;
//                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2.create(int v) {
  factory ET2.someName(int v) = ET2.create;
  factory ET2(int v) = factory.someName;
//                     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}

main() {
  print(C1);
  print(C2);
  print(ET1);
  print(ET2);
}
