// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that it is still a compile-time error if a constant
/// factory constructor is not redirecting.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1 {
  const C1();
  const factory name() => const C1();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  const C2.name();
  const factory() => const C2.name();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0;

  const E1();
  const factory name() => E1.e0;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0.name();

  const E2.name();
  const factory() => E2.e0;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET1(int _) {
  const factory name() => const ET1(0);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET2.name(int _) {
  const factory() => const ET2.name(0);
//^^^^^
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
