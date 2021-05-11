// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Unless explicitly stated otherwise, all ordinary rules that apply
/// to methods apply to abstract methods.
/// It is a compile error if an instance method m1 overrides an instance member
/// m2 and m1 has a greater number of required parameters than m2.
/// @description Checks that a compile error is produced when an abstract
/// method overrides another abstract method with the same name and greater
/// number of required parameters even if the class declaring the second method
/// is not a direct superclass of the other.
/// @author rodionov


abstract class A {
  f(var x);
}

abstract class Foo extends A {}

abstract class C extends Foo {
  f(var x, var y);
//^
// [analyzer] unspecified
// [cfe] unspecified
}

class D extends C {
  f(var x, var y) {}
}

main() {
  new D().f(2);
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  new D().f(2, 2);
}
