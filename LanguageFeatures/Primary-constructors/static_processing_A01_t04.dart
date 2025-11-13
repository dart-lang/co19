// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` or `factory` as a keyword and omitting
/// the class name in declarations of ordinary (non-primary) constructors is
/// purely syntactic. The static analysis and meaning of such constructors is
/// identical to the form that uses the class name.
///
/// @description Check that it is a compile-time error if a `new` keyword is
/// used as a constructor name in the factory constructor redirection.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class C1 {
  C1();
  factory C1.someName() = new;
//                        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  factory C2() = new.someName;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
  C2.someName();
}

extension type ET1._(int v) {
  ET1(this.v);
  factory ET1.someName(int v) = new;
//                              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2._(int v) {
  factory ET2(int v) = new.someName;
//                     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET2.someName(this.v);
}

main() {
  print(C1);
  print(C2);
  print(ET1);
  print(ET2);
}
