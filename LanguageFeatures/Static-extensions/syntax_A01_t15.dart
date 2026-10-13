// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, in an extension declaration that has an on-declaration.
///
/// @description Checks that it is still an error to declare a factory
/// constructor with a name that matches the name of the extension itself.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C();

extension ExtC1 on C {
  factory ExtC1() => C();
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtC2 on C {
  factory ExtC2() = C.new;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class MC();

extension ExtMC1 on MC {
  factory ExtMC1() => MC();
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC2 on MC {
  factory ExtMC2() = MC.new;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E() {
  e0;
}

extension ExtE on E {
  factory ExtE() => E.e0;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _);

extension ExtET1 on ET {
  factory ExtET1() => ET(0);
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET2 on ET {
  factory ExtET2(int _) = ET.new;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(MC);
  print(E);
  print(ET);
}
