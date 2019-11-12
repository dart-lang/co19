/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the corresponding class constructor
 * invocation would be a compile-time error.
 *
 * @description Check that it is a compile-time error if the corresponding class
 * constructor invocation would be a compile-time error.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class A {
  String name = "My name is A";
}

class C {
  String name = "My name is C";
}

extension ExtendedA on A {
  String checkme() => this.name;
}

extension ExtendedC on C {
  String checkme() => this.name;
}

main() {
  ExtendedA(c).checkme();
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  ExtendedC(a).checkme();
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}
