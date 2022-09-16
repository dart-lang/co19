// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s currently a compile-time error for a class to implement,
/// extend or mix-in the Enum class.
///
/// Because we want to allow interfaces and mixins that are intended to be
/// applied to enum declarations, and therefore to assume Enum to be a
/// superclass, we loosen that restriction to:
/// ...
/// It's a compile-time error if a class or mixin declaration has `Enum` as a
/// superinterface and the interface of the declarations contains an instance
/// member with the name `values`, whether declared or inherited. If any
/// concrete class implements this interface, it will be an enum declaration
/// class, and then the `values` member would conflict with the static `values`
/// constant getter that is automatically added to enum declaration classes.
/// Such an instance `values` declaration is either useless or wrong, so we
/// disallow it entirely.
///
/// @description Check that it's a compile-time error if a class has Enum as a
/// superinterface and the interface of the declarations contains an instance
/// member with the name values
/// @author sgrekhov@unipro.ru

abstract class I1 {
  int values();
}

class I2 {
  List values() => [];
}

enum E1 implements I1 {
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1,
  e2;
}

enum E2 implements I2 {
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1,
  e2;
}

enum E3 implements I1 {
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1(42),
  e2(0);

  const E3(int i);
}

enum E4 implements I2 {
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1(42),
  e2(0);

  const E4(int i);
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
}
