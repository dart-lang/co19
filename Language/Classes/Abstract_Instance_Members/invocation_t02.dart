// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Invoking an abstract method, getter or setter results in an
/// invocation of noSuchMethod exactly as if the declaration did not exist,
/// unless a suitable member a is available in a superclass, in which case a is
/// invoked.
/// @description Checks that it is a compile error when calling an
/// abstract method that is inherited from non-direct superclass.
/// @author vasya


abstract class A {
  m1();
}

abstract class A1 extends A {}
abstract class A2 extends A1 {}
class C extends A2 {
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C().m1();
}

