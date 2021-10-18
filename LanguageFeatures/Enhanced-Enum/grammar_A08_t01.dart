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
/// @description Check that it is a compile time error if enum declaration
/// contains any late fields
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum E1 {
  e1,
  e2,
  e3;

  late final int l;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void initL() {
    l = 42;
  }
}

enum E2 {
  e1(1),
  e2(2),
  e3(3);

  late final int l;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const E2(this.l);
}

main() {
  E1.e1;
  E2.e2;
}
