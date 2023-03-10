// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s currently a compile-time error for a class to implement,
/// extend or mix-in the Enum class.
///
/// Because we want to allow interfaces and mixins that are intended to be
/// applied to enum declarations, and therefore to assume Enum to be a
/// superclass, we loosen that restriction to:
///
/// It's a compile-time error if a concrete class has Enum as a superinterface
/// (directly or transitively) unless it is the corresponding class of an enum
/// declaration. (Abstract interfaces and mixins implementing Enum are allowed,
/// but only so that they can be used by enum declarations, they can never be
/// used to create an instance which implements Enum, but which is not an enum
/// value.)
///
/// @description Check that mixins implementing Enum are allowed, if they are
/// used by enum declarations
/// @author sgrekhov@unipro.ru

// @dart=2.19

abstract class M1 with Enum {}

abstract class M2 = Object with Enum;

mixin M3 implements Enum {}

enum E1 implements M1 {
  e1,
  e2;
}

enum E2 implements M2 {
  e1,
  e2;
}

enum E3 with M3 {
  e1,
  e2;
}

main() {
  print(E1);
  print(E2);
  print(E3);
}
