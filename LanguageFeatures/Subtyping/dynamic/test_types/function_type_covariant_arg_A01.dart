// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Function Type/Function: T0 is a function type and T1 is Function
///
/// @description Check that if type `T0` is a function type with a covariant
/// arguments and `T1` is a function type with arguments that are supertypes of
/// `T0` arguments, then `T0` is a subtype of `T1`.
/// @author sgrekhov22@gmail.com

class A {
  void foo(num n, [Object o = "A"]) => print("A");
}

class C implements A {
  void foo(covariant int n, [covariant String c = "C"]) => print("C");
}

A a = A();
A c = C();
void Function(num n, [Object o]) t0Instance = c.foo;
void Function(num n, [Object o]) t1Instance = a.foo;

void baz(num n, [Object o = ""]) {}
const t1Default = baz;

//# @T0 = void Function(num n, [Object o])
//# @T1 = void Function(num n, [Object o])
