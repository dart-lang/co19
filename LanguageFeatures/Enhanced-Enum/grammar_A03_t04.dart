// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We propose the following to also be allowed:
///
/// enum Name<T> with Mixin1, Mixin2 implements Interface1, Interface2 {
///   id1<int>(args1), id2<String>(args2), id3<bool>(args3);
///   memberDeclaration*
///   const Name(params) : initList;
/// }
/// where memberDeclaration* is any sequence of static and instance member
/// declarations and/or an unnamed generative const constructor declaration.
/// ...
/// The superclass of the mixin applications is the Enum class (which has an
/// abstract index getter, so the only valid super invocations are those valid
/// on Object).
///
/// @description Check that it is a compile time error if enum has no
/// implementation of any of its interfaces methods
/// @author sgrekhov@unipro.ru

class I {
  int interfaceMethod() => 0;
  int get interfaceGetter => 0;
  void set interfaceSetter(int value) {}
}

enum E1 implements I1 {
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1,
  e2,
  e3;

  int interfaceMethod() => 42;
  int get interfaceGetter => 42;
}

enum E2 implements I1 {
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1,
  e2,
  e3;

  int get interfaceGetter => 42;
  void set interfaceSetter1(int value) {}
}

enum E3 implements I1 {
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1,
  e2,
  e3;

  int interfaceMethod() => 42;
  void set interfaceSetter1(int value) {}
}

main() {
  E1.e1;
  E2.e2;
  E2.e3;
}
