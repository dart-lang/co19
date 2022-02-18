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
/// @description Check that it’s a compile-time error if a non-abstract class
/// implements Enum transitively and it is not the implicit class of an enum
/// declaration.
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

abstract class A implements Enum {
  int foo();
}

class C1 implements A {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  int get index => 42;
  int foo() => 42;
}

class C2 extends A {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  int get index => 42;
  int foo() => 42;
}

main() {
  print(C1);
  print(C2);
}
