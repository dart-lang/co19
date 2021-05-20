// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile error if m is a method and m' is a getter, or
/// if m is a getter and m' is a method.
/// @description Checks that there is a compile error if class has a method
/// and its superinterface has a getter with the same name
/// @author sgrekhov@unipro.ru


class A {
  int get m => 0;
}

class C implements A {
  int m() {
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    return 1;
  }
}

main() {
  C c = new C();
  c.m();
}
