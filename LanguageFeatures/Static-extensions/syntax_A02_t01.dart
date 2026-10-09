// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It remains an error to declare a factory constructor in an
/// extension using the old style syntax in which the constructor declaration
/// incorporates the classname, e.g. factory `ClassName.named(...)`.
///
/// @description Checks that that it is a compile-time error to declare a
/// factory constructor in an extension using the old style syntax with the
/// class name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C {
  C._();
}

extension ExtC on C {
  factory C() = C._;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  factory C.someName() => C._();
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class MC {}

extension ExtMC on MC {
  factory MC.someName() => MC();
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0._();
  E._();
}

extension ExtE on E {
  factory E() => E.e0;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  factory E.someName() => E.e0;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET._(int _) implements num {}

extension ExtET on ET {
  factory E(int _) = ET._;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  factory E.someName(int _) => ET._(0);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(MC);
  print(E);
  print(ET);
}
