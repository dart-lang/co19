// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a static warning if a setter m1 overrides a setter
/// or method m2 and the type of m1 is not a subtype of the type of m2.
/// @description Checks that a compile error is produced if the argument types
/// of these two setters are not mutually assignable.
/// @author vasya


class A {
  void set foo(String s) { }
}

class C extends A {
  void set foo(bool b) {
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new C().foo = null;
}
