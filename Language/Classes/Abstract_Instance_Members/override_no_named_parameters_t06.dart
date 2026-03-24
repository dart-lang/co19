// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Unless explicitly stated otherwise, all ordinary rules that apply
/// to methods apply to abstract methods.
/// It is a compile error if an instance method m1 overrides an instance member
/// m2 and m1 does not declare all the named parameters declared by m2.
///
/// @description Checks that a compile error is produced when the overriding
/// instance method has almost the same set of named parameters as the abstract
/// method being overriden, except for one that has a different name.
/// @author rodionov

abstract class A {
  f({x, y, z});
}

class C extends A {
  f({x, yy, z}) {}
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(A);
  print(C);
}
