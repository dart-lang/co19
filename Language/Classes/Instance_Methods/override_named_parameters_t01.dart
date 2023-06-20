// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an instance method m1 overrides an
/// instance member m2 and m1 does not declare all the named parameters declared 
/// by m2.
///
/// @description Checks that it is a compile error if an instance method `m1`
/// overrides an instance member `m2` and `m1` does not declare all the named
/// parameters declared by `m2`.
/// @author rodionov

class A {
  foo(var a, {x, y}) {}
}

class C extends A {
  foo(var a, {x}) {}
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new A().foo(2);
  new C().foo(1);
}
