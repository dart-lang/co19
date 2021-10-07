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
/// @description Check that enum can be declared with the mixins
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

mixin M on Enum {
  int mixedInMethod() => 42;
}

enum E with M {
  e1(1),
  e2(2),
  e3(3);

  int _val;

  E(this._val);

  int get sum => mixedInMethod() + _val;
}

main() {
  Expect.equals(43, E.e1.sum);
  Expect.equals(44, E.e2.sum);
  Expect.equals(45, E.e3.sum);
}
