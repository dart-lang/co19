// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s currently a compile-time error for a class to implement,
/// extend or mix-in the Enum class.
///
/// Because we want to allow interfaces and mixins that are intended to be
/// applied to enum declarations, and therefore to assume Enum to be a
/// superclass, we loosen that restriction to:
///
/// It’s a compile-time error if a non-abstract class implements Enum unless it
/// is the implicit class of an enum declaration.
///
/// It is a compile-time error if a class implements, extends or mixes-in a
/// class declared by an enum declaration.
///
/// That allows abstract classes (interfaces) which implements Enum in order to
/// have the int index; getter member available, and it allows mixin
/// declarations to use Enum as an on type because mixin declarations cannot be
/// instantiated directly.
///
/// This restriction still ensure enum values are the only object instances
/// which implements Enum, while making it valid to declare abstract class
/// MyInterface implements Enum and mixin MyMixin on Enum for interfaces and
/// mixins intended to be used in declaring enum classes.
///
/// @description Check that abstract classes may implement enum
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

abstract class C implements Enum {
  int foo();
}

enum E implements C {
  e1,
  e2;

  int foo() => this.index;
}

main() {
  Expect.equals(0, E.e1.foo());
  Expect.equals(1, E.e2.foo());
}
