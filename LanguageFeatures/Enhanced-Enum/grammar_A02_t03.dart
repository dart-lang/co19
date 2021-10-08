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
/// @description Check that it is a compile error if the superclass of the mixin
/// applications is not the Enum class
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

class C {
}

mixin M on C {
  int mixedInMethod() => 42;
}

enum E with M {
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  e1,
  e2,
  e3;
}

main() {
  E.e1;
}
