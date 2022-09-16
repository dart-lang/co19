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
///
/// @description Check that it's a compile time error to declare any abstract
/// members in enum
/// @author sgrekhov@unipro.ru

enum E1 {
  e1,
  e2,
  e3;

  void foo();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e1(),
  e2(),
  e3();

  int get foo;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3 {
  e1(1),
  e2(2),
  e3(3);

  const E3(int i);
  void set foo(int val);
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  E1.e1;
  E2.e2;
  E3.e3;
}
