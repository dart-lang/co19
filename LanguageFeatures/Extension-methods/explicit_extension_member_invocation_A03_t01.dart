/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the static type of the argument
 * expression (expr) of an explicit extension invocation is void.
 *
 * @description Check that it is a compile-time error if the static type of the
 * argument expression (expr) of an explicit extension invocation is void.
 * @issue 39156
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class C {
  String name = "My name is C";
}

extension ExtendedC on C {
  String checkme() => this.name;
}

void getC() => new C();

main() {
  ExtendedC(getC()).checkme();
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}
