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
/// @description Check that enum declaration may contain 'call' method
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

enum E1<T> {
  e1<int>(),
  e2<String>(),
  e3<bool>();

  T call(T t) => t
}

enum E2<T> {
  e1<int>(1),
  e2<String>(2),
  e3<bool>(3);

  const E3(int i);
  int call(T t) => i;
}

main() {
  Expect.equals(42, E1.e1(42));
  Expect.equals("", E1.e2(""));
  Expect.equals(false, E1.e3(false));
  Expect.equals(1, E2.e1(42));
  Expect.equals(2, E2.e2("Lily was here"));
  Expect.equals(3, E2.e3(true));
}
